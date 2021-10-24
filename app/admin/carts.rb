ActiveAdmin.register Cart do

controller do
    # This code is evaluated within the controller class
    def current_cart
      # Use Find by id to avoid potential errors
      cart = Cart.find_by_id(session[:cart_id])
      return cart if cart
      Cart.new(user: current_user, active: true)
    end

    def show
      @cart_items = current_cart.cart_items
      @order = Order.new
    end
    
  end

  permit_params :total_price, :active, :user_id,
  cart_items_attributes: [:product_id, :item_price, :total, :quantity]



  form do |f|
  f.inputs "Cart" do

    f.input :user
      f.has_many :cart_items, allow_destroy: true do |n_f|
        n_f.input :product
        n_f.input :item_price
        n_f.input :quantity
        n_f.input :total, label: "Subtotal"
        # n_f.input :item_price
        # f.input :photos, as: :file
      end
      f.input :active
      f.input :total_price
  end
  f.actions
  end
  
end
