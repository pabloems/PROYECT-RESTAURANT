class PagesController < ApplicationController

  require_relative "../models/store"
  require_relative "../models/product"
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    # @products = Product.all
    @cart_item = current_cart.cart_items.new
    @categories = Category.all
  end

end
