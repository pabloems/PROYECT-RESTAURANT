ActiveAdmin.register Product do

  # Permite crear la páginación
  config.per_page = 10

  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id


  permit_params :name, :description, :price, :discount_price, :active, :store_id, :image, category_ids:[],
  categories_attributes: [:name]


  filter :name
  filter :categories
  filter :price, as: :numeric_range_filter
  filter :active

  # Controllador Product ActiveAdmin
      controller do
    
        before_action :find_store, only: [:new, :create]

        def new
          @product = Product.new
        end

        def create
          @product = Product.new(product_params)
          @product.store = @store
          @product.category_ids = params[:product][:category_ids]
          if @product.save
            redirect_to admin_products_path, notice: "Producto creado con éxito"
          end
        end
    
        private
    
        def product_params
          params.require(:product).permit(:name, :description, :price, :discount_price, :active, :store_id, :image)
        end
    
        def find_store
          @store = Store.first(params[:store_id])
        end
    
      end

    # Index de products
  index do
    selectable_column
    column :name
    column :description
    number_column :price , as: :currency,precision: 0
    column 'Categoría' do |product|
      product.categories.map{ |bg| bg.name}
    end
    toggle_bool_column :active
    column "Image" do |product|
      if product.image.attached?
        image_tag product.image, class: 'image_product', size:'75x75'
      else
        image_tag 'logo.png', class: 'image_product', size:'75x50'
      end
    end
    actions
  end

    # Show de product
    show do
      attributes_table do
        row :name
        row :description
        number_row :price, precision: 0, as: :currency
        row :active
        row :created_at
      end
    end


  # Render de New Product
  form partial: 'form', locals: {resource: Product.new}

end
