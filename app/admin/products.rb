ActiveAdmin.register Product do
# , as: "Productos"
  # Permite crear la páginación
  config.per_page = 10
  # Nombre para desplegarlo en menú
  menu :label => "Productos"
  # Permite contenerlo en el menú adminstración
  # menu parent: :some_menu_id


  permit_params :name, :description, :price, :active, :store_id, :image, category_ids:[],
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
          params.require(:product).permit(:name, :description, :price, :active, :store_id, :category_ids, :image)
        end

        def find_store
          @store = Store.first(params[:store_id])
        end
    
      end

    # Index de products
  index do
    selectable_column
    column "Nombre", :name
    column "Descripción", :description
    number_column "Precio",:price , as: :currency,precision: 0
    column 'Categoría' do |product|
      product.categories.map{ |bg| bg.name}
    end
    toggle_bool_column "Activo", :active
    column "Imagen" do |product|
      if product.image.attached?
        image_tag product.image, size: '75x75'
      else
        image_tag 'imagen-no-disponible.jpg', size: '75x75'
      end
    end
    actions
  end

    # Show de product
    show do
      attributes_table do
      row 'Nombre' do |u|
        u.name
      end


      row 'Descripción'do |u|
        u.description
      end
        number_row "Precio", :price, precision: 0, as: :currency

      row 'Activo'do |u|
        u.active
      end
        
      row 'Fecha de Creación'do |u|
        u.created_at
      end


      end
    end

    
  # Render de New Product
  form partial: 'form', locals: {resource: Product.new}

end
