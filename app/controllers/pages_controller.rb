class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home ]
  require_relative "../admin/products"
  
  def home
      @products = Product.all
      @cart_item = current_cart.cart_items.new
  end

end
