ActiveAdmin.register Category do

  # Permite contenerlo en el menú adminstración
  # menu parent: :some_menu_id

  
  # Permite crear la páginación
  config.per_page = 10

  # Nombre para desplegarlo en menú
  menu :label => "Categorías"

   permit_params do
    permitted = [:name, :photo]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


  # Filtros personalizados
  filter :name

   index do
    selectable_column
    column "Nombre", :name
    column "Fecha de Creación", :created_at
    # column "Imagen" do |category|
    #   if category.photo.attached?
    #     cl_image_path category.photo, class: 'image_product', size: '75x75'
    #   else
    #     image_tag 'imagen-no-disponible.jpg', class: 'image_product', size: '75x75'
    #   end
    # end
    actions
  end

  
  show do
    attributes_table do

      row 'Nombre' do |u|
        u.name
      end

      row 'Fecha de Creación'do |u|
        u.created_at
      end
    end
  end


  # # Render de New Category
  form partial: 'form', locals: {resource: Category.new}


  controller do

    before_action :set_category, only: [:show]

    def show
      @products = @category.products
    end

    private
    
    def category_params
      params.require(:category).permit(:name, :photo)
    end

    def set_category
      @category = Category.find(params[:id])
    end
  end

end
