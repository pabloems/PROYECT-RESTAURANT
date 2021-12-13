ActiveAdmin.register Order, as: "Ordenes"  do
# , as: "Ordenes"
  actions :index, :show

  permit_params :status, :payment_id, :paid, :cart_id,:user_id,
  users_attributes: [ :name, :last_name ]

  filter :user
  filter :paid
  filter :created_at

  index do
    selectable_column
    column 'Usuario' do |u|
       u.user.name + ' ' + u.user.last_name
    end
    column :cart_id
    column :paid
    actions
  end

  form do |f|
  f.inputs "Orders" do
    f.input :user, :as => :select
    f.input :cart_id
    f.input :paid
  end
  f.actions
  end

  show do
    attributes_table do
      row "Usuario" do |u|
        u.user.name + " " + u.user.last_name
      end
      row :status
      row :cart_id
      row :created_at
    end
  end
end