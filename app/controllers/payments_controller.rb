class PaymentsController < ApplicationController

  def new

    @order = current_user.orders.where(status: 'Pendiente').find(params[:order_id])

    if @order.save
      session[:cart_id] = nil
    end
    # @order.user = current_user
    # @order.cart = current_cart
    # current_cart = Cart.find_by_id(session[:cart_id])
    # order = Order.create!(cart: current_cart, status: 'pendiente', user: current_user )
    
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_user.orders
    
  end

end
