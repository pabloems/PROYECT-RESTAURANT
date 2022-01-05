class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :store, inverse_of: :users, required: false
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy


  before_validation :create_store
 # Aquí creamos una cuenta y asignamos account_id al usuario
  def create_store
    storeEncontrados = Store.first(1)
    if storeEncontrados.blank?
      store = Store.new(name: 'Restaurant La Casona', address: 'Av. Ecuador #214', phone: '422- 223134')
      if store.save
        self.store_id = store.id
      else
        users.store_id = storeEncontrados
      end
    end
  end


  def full_name
    self.name + " " + self.last_name
  end

end
