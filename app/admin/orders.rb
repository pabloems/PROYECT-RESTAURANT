ActiveAdmin.register Order do

  permit_params :status, :payment_id, :paid, :cart_id, :user_id

  index do
    selectable_column
    column "Usuario", :display_name
    column :cart_id
    bool_column :paid
  end

end