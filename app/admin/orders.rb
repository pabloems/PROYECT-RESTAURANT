ActiveAdmin.register Order do

  permit_params :status, :payment_id, :paid, :cart_id,:user_id,
  users_attributes: [ :name, :last_name ]


  filter :user_id, as: :search_select_filter
  filter :paid
  filter :created_at

  index do
    selectable_column
    column 'Usuario' do |display|
       display.user.name + ' ' + display.user.last_name
    end
    column :cart_id
    bool_column :paid
    actions
  end

  form do |f|
  f.inputs "Orders" do

    f.input :user, :as => :select
    f.input :cart, :as => :select
    f.input :paid
  end
  f.actions
  end

end