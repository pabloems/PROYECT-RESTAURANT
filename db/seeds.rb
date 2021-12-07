
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

categories1 = Category.create(name: "Hamburguesas")
categories2 = Category.create(name: "Pizzas")
categories3 = Category.create(name: "Sándwiches")
categories4 = Category.create(name: "Bebidas")
puts "se crearon #{Category.count} categorías"



puts "Creando productos"

# Pizzas seed´s
product1= Product.create(name: "Pizza Napolitana", description: "Formato familiar.", price: 9990, store: Store.first, active: true)
product2 = Product.create(name: "Pizza Francesa", description: "Formato familiar.", price: 9990, store: Store.first, active: true)
product3 = Product.create(name: "Pizza Pollo Caprese", description: "Formato familiar.", price: 9990, store: Store.first, active: true)
product4 = Product.create(name: "Pizza Vegan Royal", description: "Formato familiar.", price: 11990, store: Store.first, active: true)
product6 = Product.create(name: "Pizza Super Peperoni", description: "Formato familiar.", price: 11990, store: Store.first, active: true)
product7 = Product.create(name: "Pizza Hawaiana", description: "Para 2 personas.", price: 7999, store: Store.first, active: true)

product13 = Product.create(name: "Pizza Napolitana", description: "Para 2 personas.", price: 8490, store: Store.first, active: true)
product14 = Product.create(name: "Pizza Francesa", description: "Para 2 personas.", price: 9990, store: Store.first, active: false)
product15 = Product.create(name: "Pizza Pollo Caprese", description: "Individual", price: 9990, store: Store.first, active: false)
product16 = Product.create(name: "Pizza Vegan Royal", description: "Individual", price: 8490, store: Store.first, active: true)
product17 = Product.create(name: "Pizza Super Peperoni", description: "Para 2 personas.", price: 11990, store: Store.first, active: true)
product18 = Product.create(name: "Pizza Hawaiana", description: "Para 2 personas.", price: 7999, store: Store.first, active: false)


# Hamburguesa seed´s
product5 = Product.create(name: "Burger Todas las carnes", description:  "Formato individual. ", price: 11990, store: Store.first, active: true)
product8 = Product.create(name: "Burger BBQ", description: "Formato individual.", price: 8490, store: Store.first, active: true)
product9 = Product.create(name: "Burger San Francisco", description: "Formato individual.", price: 6490, store: Store.first, active: true)
product10 = Product.create(name: "Burger Ruta 5", description: "Formato individual.", price: 4990, store: Store.first, active: false)
product11 = Product.create(name: "Burger New York", description:  "Formato individual.", price: 4990, store: Store.first, active: false)
product12 = Product.create(name: "Burger La Gringa", description: "Formato individual.", price: 4990, store: Store.first, active: false)


# Sandwich seed´s
product19 = Product.create(name: "Sabroson", description: "Formato individual.", price: 4990, store: Store.first, active: true)
product20 = Product.create(name: "Italiano", description: "Formato individual.", price: 4990, store: Store.first, active: true)
product21 = Product.create(name: "Chacarero", description: "Formato individual.", price: 4990, store: Store.first, active: true)
product22 = Product.create(name: "Buffalo", description: "Formato individual.", price: 4990, store: Store.first, active: true)
product23 = Product.create(name: "Magnum", description: "Formato individual.", price: 4990, store: Store.first, active: false)
product24 = Product.create(name: "Mustang", description: "Formato individual.", price: 4990, store: Store.first, active: false)

# Bebestible seed's
product25 = Product.create(name: "Café", description: "Formato individual.", price: 4990, store: Store.first, active: false)
product26 = Product.create(name: "Té", description: "Formato individual.", price: 4990, store: Store.first, active: false)
product27 = Product.create(name: "Sprite 1lt", description: "Formato familiar.", price: 4990, store: Store.first, active: true)
product28 = Product.create(name: "Cerveza Corona", description: "Formato individual.", price: 4990, store: Store.first, active: true)
product29 = Product.create(name: "Sprite", description: "Formato individual.", price: 4990, store: Store.first, active: true)
product30 = Product.create(name: "Jugo Natural", description: "Formato individual.", price: 4990, store: Store.first, active: false)
puts "se crearon #{Product.count} productos"

puts "Anidando recursos"
# Pizzas seed´s
product1.categories << categories2
product2.categories << categories2
product3.categories << categories2
product4.categories << categories2
product6.categories << categories2
product7.categories << categories2
product13.categories << categories2
product14.categories << categories2
product15.categories << categories2
product16.categories << categories2
product17.categories << categories2
product18.categories << categories2


# Hamburguesa seed´s
product5.categories << categories1
product8.categories << categories1
product9.categories << categories1
product10.categories << categories1
product11.categories << categories1
product12.categories << categories1


# Sandwich seed´s
product19.categories << categories3
product20.categories << categories3
product21.categories << categories3
product22.categories << categories3
product23.categories << categories3
product24.categories << categories3

# Bebestible seed´s
product25.categories << categories4
product26.categories << categories4
product27.categories << categories4
product28.categories << categories4
product29.categories << categories4
product30.categories << categories4

puts "Se anidaron recursos."
puts "Seed´s terminado"



# 50.times do
#   product = Product.create!(
#     name: Faker::Food.dish,
#     description: Faker::Food.measurement,
#     price: Faker::Number.between(from: 5990, to: 14990),
#     store: Store.first,
#     active: [true, false].sample,
    
#     )
#     puts "se crearon #{Product.count} productos"
#     product.save
#     product_category = ProductCategory.create(category: category, product: product)
#   end



# categories[4] = Category.create(name: "Papas Fritas")
# categories[6] = Category.create(name: "Tacos")

# 10.times do
  
#   category = Category.create(
#   name: Faker::Food.ethnic_category
#   )

# end
