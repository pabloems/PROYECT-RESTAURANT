ActiveAdmin.register Product do
# , as: "Platos"
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


  index do
    selectable_column
    column :name
    column :description
    number_column :price , as: :currency, unit: "$", separator: "."
    column 'Categoría' do |display|
      display.categories.name
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


  form partial: 'form', locals: {resource: Product.new}

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

end
