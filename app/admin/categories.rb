ActiveAdmin.register Category do

  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id

   permit_params do
    permitted = [:name]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  # Filtros personalizados
  filter :name

   index do
    selectable_column
    column :name
    column :created_at
  end

end
