
puts "Reiniciando base de datos"

puts "Eliminando registros anteriores"

User.destroy_all
Store.destroy_all
Product.destroy_all
Category.destroy_all

puts "Creando usuarios"

users = []
users[1] = User.create(email: "admin@correo.cl", admin: true, name: "Pablo", last_name: "Martínez", password: "123456", phone: " +569 44556677")
users[2] = User.create(email: "esteban@correo.cl", admin: true, name: "Esteban", last_name: "Sepúlveda", password: "123456", phone: "+569 55667788")
users[3] = User.create(email: "marcelo@correo.cl", admin: true, name: "Marcelo", last_name: "Sepúlveda", password: "123456", phone: "+569 33442211")
users[4] = User.create(email: "alejandro@correo.cl", admin: false, name: "Alejandro", last_name: "Cartes", password: "123456", phone: "+569 44112255")
users[5] = User.create(email: "maria@correo.cl", admin: false, name: "Maria", last_name: "Vasquez", password: "123456", phone: "+569 88776655")
users[6] = User.create(email: "carolina@correo.cl", admin: false, name: "Carolina", last_name: "Caro", password: "123456", phone: "+569 99887744")
users[7] = User.create(email: "catalina@correo.cl", admin: false, name: "Catalina", last_name: "Mellado", password: "123456", phone: "+569 88755662")
users[8] = User.create(email: "mabel@correo.cl", admin: false, name: "Mabel", last_name: "Molina", password: "123456", phone: "+569 44665599")


puts "Creando categorías"

categories = []

categories[1] = Category.create(name: "Hamburguesa")
categories[2] = Category.create(name: "Pizzas")
categories[3] = Category.create(name: "Sandwich")
categories[4] = Category.create(name: "Papas Fritas")
categories[6] = Category.create(name: "Tacos")
categories[5] = Category.create(name: "Bebidas")

puts "Creando productos"

products = []

products[1] = Product.create(name: "Pizza Napolitana", description: "bueno y rico", price: 9990, store: store.id)
products[2] = Product.create(name: "Pizza Francesa", description: "bueno y rico", price: 9990, store: store.id)
products[3] = Product.create(name: "Pizza Pollo Caprese", description: "bueno y rico", price: 9990, store: store.id)
products[4] = Product.create(name: "Pizza Vegan Royal", description: "bueno y rico", price: 11990, store: store.id)
products[5] = Product.create(name: "Pizza Todas las carnes", description: "bueno y rico", price: 11990, store: store.id)
products[6] = Product.create(name: "Pizza Super Peperoni", description: "bueno y rico", price: 11990, store: store.id)
products[7] = Product.create(name: "Pizza Hawaiana", description: "bueno y rico", price: 7999, store: store.id)
products[8] = Product.create(name: "Pizza BBQ", description: "bueno y rico", price: 8490, store: store.id)
products[9] = Product.create(name: "Hamburguesa San Francisco", description: "bueno y rico", price: 6490, store: store.id)
products[10] = Product.create(name: "Hamburguesa Ruta 5", description: "bueno y rico", price: 4990, store: store.id)
products[11] = Product.create(name: "Hamburguesa New York", description: "bueno y rico", price: 4990, store: store.id)
products[12] = Product.create(name: "Hamburguesa La Gringa", description: "bueno y rico", price: 4990, store: store.id)

puts "Seed´s terminado"