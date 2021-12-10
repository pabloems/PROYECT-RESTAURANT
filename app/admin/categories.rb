ActiveAdmin.register Category do
# , as: "Categorias"
  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id


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
    actions
  end


  # Render de New Category
  form partial: 'form', locals: {resource: Category.new}


  controller do

    before_action :set_category, only: [:show ]

    def show
      @products = @category.products
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end
  end

end
