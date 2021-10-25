ActiveAdmin.register Category do

   permit_params do
    permitted = [:name]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  filter :name

   index do
    selectable_column
    column :name
    column :created_at
  end

end
