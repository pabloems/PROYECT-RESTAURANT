class DeleteDiscountPriceFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :discount_price
  end
end
