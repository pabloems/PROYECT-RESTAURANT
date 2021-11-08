class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home ]
  require_relative "../admin/products"
  
  def home
      @products = Product.all
  end

end
