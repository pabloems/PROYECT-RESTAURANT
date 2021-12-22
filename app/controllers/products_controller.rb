class ProductsController < ApplicationController

  def index
    if params[:q]

      @pagy, @products = pagy(@q.result(distinct: true), items: 5)
      @q = Product.ransack(params[:q])
    else
    @pagy, @products = pagy(@category.products.visible, items: 5)
    end
    @cart_item = current_cart.cart_items.new
  end

end

