class CategoriesController < ApplicationController

  before_action :set_category, only: :show

  def show
    
    if params[:q]
      @pagy, @products = pagy(@q.result(distinct: true), items: 5)
      @q = Product.ransack(params[:q])
    else
    @pagy, @products = pagy(@category.products.visible, items: 6)
    end
    @cart_item = current_cart.cart_items.new
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
