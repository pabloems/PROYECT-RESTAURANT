ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :email, :store_id, :admin, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :store_id, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    index do
    selectable_column
    column :id
    column :email
    column :name
    column :admin
    column :last_name
    column :address
    column :phone
    actions
  end

    # Cambios en el formulario
    form do |f|
    f.inputs "Identity" do

      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :store
    end
    f.inputs "Admin" do
      f.input :admin

    end
    f.actions
  end

  permit_params  :email, :admin, :password_confirmation, :password, :store_id
  
end
