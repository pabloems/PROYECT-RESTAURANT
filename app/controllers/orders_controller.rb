require_relative '../models/cart'
class OrdersController < ApplicationController

  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.cart = current_cart
  end

  def new
  end

  def edit
  end

  def update
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end


end