ActiveAdmin.register User, as: "Colaboradores" do

  config.comments = false
  permit_params :admin, :name, :last_name, :phone, :email, :store_id, :password, :password_confirmation

  # Permite contenerlo en el menú adminstración
  # menu parent: :some_menu_id

  
  # Permite crear la páginación
  config.per_page = 10

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
    f.inputs "Crear Colaborador" do

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
      row 'Email'do |u|
        u.email
      end

      row 'Teléfono'do |u|
        u.phone
      end

      row 'Administrador'do |u|
        u.admin
      end

      row 'Fecha de Creación'do |u|
        u.created_at
      end
    end
  end
end
