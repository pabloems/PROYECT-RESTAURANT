class CartItemsController < ApplicationController

   before_action :set_cart

    def create
      @cart_items = @cart.cart_items.new(cart_items_params)
      join = @cart.cart_items.where(product_id: @cart_items[:product_id])
      if join.size == 0
        @cart.save
      else
        join.first.update(quantity: join.first.quantity + @cart_items[:quantity])
      end

      session[:cart_id] = @cart.id
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    end

    def update
      @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.update(cart_items_params)
      @cart_items = current_cart.cart_items
      if @cart_item.blank?
        @cart_item.destroy
      end
    end

    def destroy
      @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.destroy
      @cart_items = current_cart.cart_items
    end

    private

    def cart_items_params
      params.require(:cart_item).permit(:quantity, :item_price, :total, :product_id, :cart_id)
    end

    def set_cart
      @cart = current_cart
    end

end
