class Store < ApplicationRecord

  has_many :users, inverse_of: :store, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true,  length: { in: 2..30 }
  validates :address, presence: true, length: { minimum: 9 }
  validates :phone, presence: true, length: { minimum: 9 }

end
