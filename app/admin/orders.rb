ActiveAdmin.register Order do

  permit_params :status, :payment_id, :paid, :cart_id, :user_id

  filter :user_id, as: :search_select_filter
  filter :paid
  filter :created_at

  index do
    selectable_column
    column "Usuario", :user_id
    column :cart_id
    bool_column :paid
  end

end