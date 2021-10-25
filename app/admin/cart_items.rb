ActiveAdmin.register CartItem do

  permit_params :quantity, :item_price, :total, :product_id, :cart_id

  index do
    selectable_column
    column :product_id
    column :quantity
    number_column :item_price, as: :currency, unit: "$", separator: "."
    number_column :total, as: :currency, unit: "$", separator: "."
    column :cart_id
  end

  controller do

  before_save :set_total

    def create
      @cart_items = @cart.cart_items.new(cart_items_params)
      match = @cart.cart_items.where(product_id: @cart_items[:product_id])
      if match.size == 0
        @cart.save
      else
        match.first.update(quantity: match.first.quantity + @cart_items[:quantity])
      end

      session[:cart_id] = @card.id
      respond_to do |format|
        format.js { redirect_to request.referrer }
        
      end
    end

    def update
      @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.update_attributes(cart_items_params)
      @cart_items = current_cart.cart_items
      if
        @cart_item.quantity == 0
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

  end

end
