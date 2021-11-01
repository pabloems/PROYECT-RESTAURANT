class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # accepts_nested_attributes_for :products, allow_destroy: true
  # def total
  #   return item_price * quantity
  # end

  # private

  # def set_total
  #   self[:total] = total * quantity
  # end
end
