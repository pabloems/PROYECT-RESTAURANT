ActiveAdmin.register Product do

  # Permite crear la páginación
  config.per_page = 1

  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id

  permit_params do
    permitted = [:name, :description, :price, :discount_price, :active, :store_id, category_ids:[]]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  filter :name
  filter :categories
  filter :price, as: :numeric_range_filter


  index do
  selectable_column
    column :name
    column :description
    number_column :price, as: :currency, unit: "$", separator: "."
    column :categories
    column :active
    
    actions
  end

     form do |f|
  f.inputs "Products" do

    f.input :name
    f.input :description
    f.input :price
    f.input :discount_price
    f.input :store
    f.input :active
    f.input :categories, :as => :check_boxes
  end
  f.actions
  end

end
