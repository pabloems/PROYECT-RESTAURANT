
puts "Reiniciando base de datos"

puts "Eliminando registros anteriores"

User.destroy_all
Store.destroy_all
Product.destroy_all
Category.destroy_all

puts "Creando usuarios"

users = []
users[1] = User.create(email: "admin@correo.cl", admin: true, name: "Pablo", last_name: "Martínez", password: "123456", phone: " +569 44556677", store_id: 1)
users[2] = User.create(email: "esteban@correo.cl", admin: true, name: "Esteban", last_name: "Sepúlveda", password: "123456", phone: "+569 55667788", store_id: 1)
users[3] = User.create(email: "marcelo@correo.cl", admin: true, name: "Marcelo", last_name: "Sepúlveda", password: "123456", phone: "+569 33442211", store_id: 1)
users[4] = User.create(email: "alejandro@correo.cl", admin: false, name: "Alejandro", last_name: "Cartes", password: "123456", phone: "+569 44112255", store_id: 1)
users[5] = User.create(email: "maria@correo.cl", admin: false, name: "Maria", last_name: "Vasquez", password: "123456", phone: "+569 88776655", store_id: 1)
users[6] = User.create(email: "carolina@correo.cl", admin: false, name: "Carolina", last_name: "Caro", password: "123456", phone: "+569 99887744", store_id: 1)
users[7] = User.create(email: "catalina@correo.cl", admin: false, name: "Catalina", last_name: "Mellado", password: "123456", phone: "+569 88755662", store_id: 1)
users[8] = User.create(email: "mabel@correo.cl", admin: false, name: "Mabel", last_name: "Molina", password: "123456", phone: "+569 44665599", store_id: 1)

puts "Se crearon #{User.count} usuarios"

puts "Creando categorías"

# categories = []

# categories[1] = Category.create(name: "Hamburguesa")
# categories[2] = Category.create(name: "Pizzas")
# categories[3] = Category.create(name: "Sandwich")
# categories[4] = Category.create(name: "Papas Fritas")
# categories[6] = Category.create(name: "Tacos")
# categories[5] = Category.create(name: "Bebidas")


10.times do
  
  Category.create(
  name: Faker::Food.ethnic_category
  )

  puts "se crearon #{Category.count} categorías"
end



puts "Creando productos"

# products = []

# products[1] = Product.create(name: "Pizza Napolitana", description: "bueno y rico", price: 9990, store: store.id)
# products[2] = Product.create(name: "Pizza Francesa", description: "bueno y rico", price: 9990, store: store.id)
# products[3] = Product.create(name: "Pizza Pollo Caprese", description: "bueno y rico", price: 9990, store: store.id)
# products[4] = Product.create(name: "Pizza Vegan Royal", description: "bueno y rico", price: 11990, store: store.id)
# products[5] = Product.create(name: "Pizza Todas las carnes", description: "bueno y rico", price: 11990, store: store.id)
# products[6] = Product.create(name: "Pizza Super Peperoni", description: "bueno y rico", price: 11990, store: store.id)
# products[7] = Product.create(name: "Pizza Hawaiana", description: "bueno y rico", price: 7999, store: store.id)
# products[8] = Product.create(name: "Pizza BBQ", description: "bueno y rico", price: 8490, store: store.id)
# products[9] = Product.create(name: "Hamburguesa San Francisco", description: "bueno y rico", price: 6490, store: store.id)
# products[10] = Product.create(name: "Hamburguesa Ruta 5", description: "bueno y rico", price: 4990, store: store.id)
# products[11] = Product.create(name: "Hamburguesa New York", description: "bueno y rico", price: 4990, store: store.id)
# products[12] = Product.create(name: "Hamburguesa La Gringa", description: "bueno y rico", price: 4990, store: store.id)


50.times do
  product = Product.create!(
    name: Faker::Food.dish,
    description: Faker::Food.measurement,
    price: Faker::Number.between(from: 5990, to: 14990),
    store: Store.first,
    active: [true, false].sample,
    
    )
    puts "se crearon #{Product.count} productos"

  end

puts "Seed´s terminado"