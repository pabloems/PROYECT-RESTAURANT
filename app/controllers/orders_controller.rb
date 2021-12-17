require_relative '../models/cart'

class OrdersController < ApplicationController


  def index
    @pagy, @orders = pagy(current_user.orders, items: 10)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create

    @order = Order.new
    @order.user = current_user
    @order.cart = current_cart

    current_cart = Cart.find_by_id(session[:cart_id])
    order = Order.create!(cart: current_cart, status: 'Pendiente', user: current_user )

    session =  Stripe::Checkout::Session.create({
      mode: 'payment',
      payment_method_types: ['card'],
      line_items:  [{
        name: current_cart.id ,
        amount: current_cart.total_price,
        currency: 'clp',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    })

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

  end


end