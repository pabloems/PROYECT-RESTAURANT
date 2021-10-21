ActiveAdmin.register Product do


  permit_params do
    permitted = [:name, :description, :price, :discount_price, :active, :store_id, category_ids:[]]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
  selectable_column
  column :name
  number_column :price, as: :currency, unit: "$", separator: "."
  column :active
  # column :store
  column :categories
  end

     form do |f|
  f.inputs "Products" do

    f.input :name
    f.input :description
    f.input :price
    f.input :discount_price
    f.input :active
    f.input :store
    f.input :categories, :as => :check_boxes
    # f.input :photos, as: :file
  end
  f.actions
  end

end
