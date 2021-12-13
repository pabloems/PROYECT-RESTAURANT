class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  accepts_nested_attributes_for :user, allow_destroy: false

  before_create :set_status

  STATUSES = {

  in_process:'En proceso',
  rejected: 'Rechazada',
  payed: 'Pagada',
  on_delivery: 'En tránsito',
  completed: 'Completada'
  }

  
  private

  def set_status
    self.status = STATUSES[:payed]
  end


end
