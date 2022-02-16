class PaymentsController < ApplicationController

  def new

    @order = current_user.orders.where(status: 'Pendiente').find(params[:order_id])

    if @order.save
      session[:cart_id] = nil
    end

  end

  def show
    @order = Order.find(params[:id])
    @orders = current_user.orders
  end

end
