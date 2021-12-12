class CategoriesController < ApplicationController

  before_action :set_category, only: :show

  def show
    # @pagy, @products = pagy(@category.products, items: 5)
    @pagy, @products = pagy(@q.result(distinct: true), items: 5)
    @q = Product.ransack(params[:q])
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
