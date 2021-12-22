class Product < ApplicationRecord
  belongs_to :store
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :categories, allow_destroy: true
  has_one_attached :image

  validates :name, presence: true, length: {minimum: 3, maximum:100}
  validates :description, presence: true
  validates :price, presence: true
  

  # Callback
  after_create :create_stripe_product

  # Scope product-active
  scope :visible, -> {where(active: true)}


  def create_stripe_product
    product = Stripe::Product.create({name: "Producto ##{id}"})
    pricing = Stripe::Price.create({
      product: product.id,
      unit_amount: price,
      currency: 'clp'
    })
    update(stripe_product_id: product.id , stripe_pricing_id: pricing.id)
  end

end

