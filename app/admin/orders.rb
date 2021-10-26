ActiveAdmin.register Order do

  permit_params :status, :payment_id, :paid, :cart_id, :user_id


  filter :user_id, as: :search_select_filter
  filter :paid
  filter :created_at

  index do
    selectable_column
    column :user_id
    column :cart_id
    bool_column :paid
  end

  form do |f|
  f.inputs "Orders" do

    f.input :user, :as => :select, :collection => User.all
    f.input :cart, :as => :select, :collection =>Cart.all
    f.input :status
    f.input :paid
  end
  f.actions
  end

end