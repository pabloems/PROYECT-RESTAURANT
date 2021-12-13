ActiveAdmin.register Category  do
# , as: "Categorias"
  # Permite contenerlo en el menú adminstración
  # menu parent: :some_menu_id


   permit_params do
    permitted = [:name, :photo]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  # Filtros personalizados
  filter :name

   index do
    selectable_column
    column :name
    column :created_at
    column "Imagen" do |category|
      if category.photo.attached?
        image_tag category.photo, class: 'image_product', size: '75x75'
      else
        image_tag 'logo.png', class: 'image_product', size: '75x75'
      end
    end
    actions
  end


  # # Render de New Category
  # form partial: 'form', locals: {resource: Category.new}


  controller do

    before_action :set_category, only: [:show]

    # def new
    #   @category = Category.new
    # end

    # def create
    #   @category = Category.new(category_params)
    # end

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
