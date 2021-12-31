class ProductsController < ApplicationController

  def index

    # El resultado de la búsqueda solo traerá products activos
    if params[:q]
      @q = Product.visible.ransack(params[:q])
      @pagy, @products = pagy(@q.result(distinct: true), items: 9)
    else
    @pagy, @products = pagy(@category.products.visible, items: 9)
    end
    @cart_item = current_cart.cart_items.new
  end

end

