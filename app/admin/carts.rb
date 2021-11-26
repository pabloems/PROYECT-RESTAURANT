ActiveAdmin.register Cart do
# , as: "Carritos"  
  permit_params :total_price, :active, :user_id,
  cart_items_attributes: [:product_id, :item_price, :total, :quantity],
  users_attributes: [ :name, :last_name ]
  actions :index, :show

# Filtros empleados
  filter :user
  filter :active
  filter :total_price
  filter :created_at


  index do
    selectable_column
    column :id
    column 'Colaborador' do |u|
      u.user.name + ' ' + u.user.last_name
    end
    number_column "Precio total" ,:total_price, as: :currency, precision: 0
    column "Fecha de Creación",:created_at

    actions
  end


  form do |f|
  f.inputs "Cart" do

    f.input :user
    f.has_many :cart_items, allow_destroy: true do |n_f|
      n_f.input :product
      n_f.input :item_price
      n_f.input :quantity
      n_f.input :total, label: "Subtotal"
    end
    f.input :active
    f.input :total_price
  end
  f.actions
  end

  show do
    attributes_table do
      row "Colaborador" do |u|
        u.user.name + " " + u.user.last_name
      end
      number_row :total_price, as: :currency, precision: 0
      row :active
      row :created_at
    end

  end

end
