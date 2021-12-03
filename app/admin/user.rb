ActiveAdmin.register User do
# , as: "Colaboradores"
  config.comments = false
  permit_params :admin, :name, :last_name, :phone, :email, :store_id, :password, :password_confirmation

  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id

  # Filtros personalizados
  filter :admin
  filter :name


  index do
    selectable_column
    column :id
    column 'Colaborador' do |u|
      u.full_name
    end
    column :email
    column :phone
    column :admin
    actions
  end

    # Cambios en el formulario
  form do |f|
    f.inputs "Identity" do

      f.input :name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :password
      f.input :password_confirmation
      f.input :store
      f.input :admin
    end

    f.actions
  end
  

  show do
    attributes_table do
      row 'Usuario' do |u|
        u.full_name
      end
      row :email
      row :phone
      row :admin
      row :created_at
    end
  end
end
