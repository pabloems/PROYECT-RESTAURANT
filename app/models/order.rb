class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  accepts_nested_attributes_for :user, allow_destroy: false


  scope :order_paid,-> {where(status: 'Pagado')}
  scope :order_pending, -> { where(status: 'Pendiente')}
end
