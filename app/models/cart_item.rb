class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # before_save :set_total

  # def total
  #   return item_price * quantity
  # end

  # private

  # def set_total
  #   self[:total] = total * quantity
  # end
end
