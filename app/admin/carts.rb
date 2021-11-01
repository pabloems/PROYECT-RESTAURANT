ActiveAdmin.register Cart do

  permit_params :total_price, :active, :user_id,
  cart_items_attributes: [:product_id, :item_price, :total, :quantity]

  filter :user
  filter :active
  filter :total_price
  filter :created_at


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