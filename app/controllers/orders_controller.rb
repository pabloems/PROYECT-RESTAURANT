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
    order = Order.create!(cart: current_cart, status: 'pendiente', user: current_user )
    # prices = current_cart.products.map do |product|
    #   {price: product.stripe_pricing_id, quantity: 1, description: product.name}
    # end

    session =  Stripe::Checkout::Session.create({
      # mode: 'payment',
      payment_method_types: ['card'],
      line_items:[{
      name: current_cart.id,
      amount: current_cart.total_price,
      quantity: 1,
      currency: 'clp'
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    })

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

    # if @order.save
    #   join = @order.cart.total_price
    #   if join.payment_id
    #     session[:cart_id] = nil
    #     @order.payment_id = join.payment_id
    #     @order.paid = true
    #     @order.save
    #   else
    #     # implementar pago débito
    #   end
    #   redirect_to @order
    # else
    #   redirect_to root_path
    # end
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

end