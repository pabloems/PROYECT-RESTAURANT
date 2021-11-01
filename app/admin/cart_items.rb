ActiveAdmin.register CartItem do

  
  # Permite contenerlo en el menú adminstración
  menu parent: :some_menu_id

  permit_params :quantity, :item_price, :total, :cart_id, :product_id

  index do
    selectable_column

  column :product_id
  column :quantity
  number_column :item_price, as: :currency, unit: "$", separator: "."
  number_column :total, as: :currency, unit: "$", separator: "."
  column :cart_id

  end

end

