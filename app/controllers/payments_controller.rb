class PaymentsController < ApplicationController

  def new

    @order = current_user.orders.where(status: 'pendiente').find(params[:order_id])


    # @order.user = current_user
    # @order.cart = current_cart
    # current_cart = Cart.find_by_id(session[:cart_id])
    # order = Order.create!(cart: current_cart, status: 'pendiente', user: current_user )
  end

end
