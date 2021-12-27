ActiveAdmin.register Order, as: "Ordenes"  do

  actions :index, :show

  permit_params :status, :payment_id, :paid, :cart_id,:user_id,
  users_attributes: [ :name, :last_name ]

  scope :order_paid

  # Permite crear la páginación
  config.per_page = 10

  # Filtros personalizados (addons-gem)
  filter :user
  filter :paid
  filter :created_at

  index do
    selectable_column
    column :id
    column 'Colaborador' do |u|
       u.user.name + ' ' + u.user.last_name
    end
    column "Pedido", :cart_id
    column "Estado", :status
    column "Pagado", :paid
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