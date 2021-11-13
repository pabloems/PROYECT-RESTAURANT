class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :cart_items, allow_destroy: true
  accepts_nested_attributes_for :user, allow_destroy: false

  before_save :set_total_price

  def total_price
    cart_items.collect do |cart_item|
    cart_item.item_price * cart_item.quantity
    end
  end

  private

  def set_total_price
    self[:total_price] = total_price
  end


end