class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  before_save :set_item_price
  before_save :set_total

  # Solo se podrá agregar al carro más de 1
  validates :quantity, numericality: {greater_than_or_equal_to: 1}


  def item_price
    # if there is a record
    if persisted?
      self[:item_price]
    else
      product.price
    end
  end

  def total
    return item_price * quantity
  end

  private

  def set_item_price
    self[:item_price] = item_price
  end

  def set_total
    self[:total] = total * quantity
  end

end
