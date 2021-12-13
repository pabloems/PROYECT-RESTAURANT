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

    current_cart = Cart.find_by_id(session[:cart_id])
    order = Order.create!(cart: current_cart, status: 'Pendiente', user: current_user )
    prices = current_cart.products.map do |product|
      {price: product.stripe_pricing_id, quantity: 1, description: product.name}
    end

    session =  Stripe::Checkout::Session.create({
      mode: 'payment',
      payment_method_types: ['card'],
      line_items: prices,
      success_url: order_url(order),
      cancel_url: order_url(order)
    })

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

end