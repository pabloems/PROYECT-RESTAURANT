class CheckoutController < ApplicationController

  def create

    cart = Cart.find_by_id(session[:cart_id])
    @session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
    line_items: [{
        name: cart.id ,
        amount: cart.total_price,
        currency: 'clp',
        quantity: 1
      }],
    mode: 'payment',
    success_url: root_url,
    cancel_url: root_url,
    })

    respond_to do |format|
      format.js
    end

  end


end
