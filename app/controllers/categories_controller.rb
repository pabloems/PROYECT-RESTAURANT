class CategoriesController < ApplicationController

  before_action :set_category, only: :show

  def show
    @pagy, @products = pagy(@category.products, items: 5)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end
