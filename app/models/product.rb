class Product < ApplicationRecord
  belongs_to :store
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories


  validates :name, presence: true, length: {minimum: 3, maximum:100}
  validates :description, presence: true, length: {minimum:5, maximum: 100}
  validates :price, presence: true
end

