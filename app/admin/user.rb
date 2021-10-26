ActiveAdmin.register User do

  config.comments = false
  permit_params :admin, :name, :last_name, :phone, :email, :store_id, :password, :password_confirmation

  filter :admin
  filter :name


  index do
    selectable_column
    column :id
    column :admin
    column :name
    column :last_name
    column :email
    column :phone
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
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end
end
