ActiveAdmin.register Cart do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :total_price, :active, :user_id,
  cart_items_attributes: [:product_id, :item_price, :total, :quantity]
  #
  # or
  #
  # permit_params do
  #   permitted = [:total_price, :active, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

       form do |f|
  f.inputs "Cart" do

    f.input :user
    f.has_many :cart_items, allow_destroy: true do |n_f|
      n_f.input :product
      n_f.input :quantity
      n_f.input :total, label: "Subtotal"
    end
      # n_f.input :item_price
    f.input :active
    f.input :total_price
    # f.input :photos, as: :file
  end
  f.actions
  end
  
end
