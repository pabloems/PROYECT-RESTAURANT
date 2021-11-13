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

    def create
      @order = current_cart
      @cart_item = @order.cart_items.new(order_params)
      @cart.save
      session[:cart_id] = @order.id
    end

    def update

    end

    def destroy

    end

    private

    def order_params

    end
  end
end
