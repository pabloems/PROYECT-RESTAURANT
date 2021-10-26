class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :store, inverse_of: :users, required: false

  before_validation :create_store
 # Aquí creamos una cuenta y asignamos account_id al usuario
  def create_store
    storeEncontrados = Store.first(1)
    if storeEncontrados.blank?
      store = Store.new(name: 'Restaurant Fast Food', address: 'Av. Ecuador #214', phone: '422- 223134')
      if store.save
        self.store_id = store.id
      else
        users.store_id = storeEncontrados
      end
    end
  end



end
