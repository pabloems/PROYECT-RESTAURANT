ActiveAdmin.register CartItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :quantity, :item_price, :total, :product_id, :cart_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:quantity, :item_price, :total, :product_id, :cart_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  controller do

    before_action :set_cart

    def create
      # cart_item
      @cart_items = @cart.cart_items.new(cart_items_params)
      @cart.save
      session[:cart_id] = @cart.id
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    end

    def update
      @cart_item = @cart.cart_items.find(params[:id])
      @cart_item.update_attributes(cart_items_params)
      @cart_items = current_cart.cart_items
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
end
