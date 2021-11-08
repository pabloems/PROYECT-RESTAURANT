ActiveAdmin.register Product, as: "Productos" do

  # Permite crear la páginación
  config.per_page = 2

  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id

  permit_params :name, :description, :price, :discount_price, :active, :store_id, :image, category_ids:[],
  categories_attributes: [:name]


  filter :name
  filter :categories
  filter :price, as: :numeric_range_filter


  index do
  selectable_column
    column :name
    column :description
    number_column :price , as: :currency, unit: "$", separator: "."
    column 'Categoría' do |display|
      display.categories.name
    end
    column :active
    column "Image" do |product|
      image_tag product.image, class: 'my_image_size', size:'100x75'
    end
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
    f.inputs do
      f.input :image, as: :file
    end
  end
  f.actions
  end

end
