require_relative '../models/cart'

class OrdersController < ApplicationController



  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def create
    @order  = Order.new
    @order.user = current_user
    @order.cart = current_cart

    if @order.save
      payment_information = (@order.cart.total_price)
      if payment_information.payment_id
        session[:cart_id] = nil
        @order.payment_id = payment_information.payment_id
        @order.paid = true
        @order.save
      else
        # implementar pago débito
      end
      redirect_to @order
    else
      redirect_to root_path
    end
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end


end