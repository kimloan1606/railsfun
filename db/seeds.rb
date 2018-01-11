# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
ActiveRecord::Base.connection.execute('ALTER TABLE products AUTO_INCREMENT=1')
Product.create!(title: 'Ruby Book', description: 'learn ruby programing' , price: 12.99, published: true)
Product.create!(title: 'jQuery Book', description: 'learn jQuery', price: 11.99, published:true)
Product.create!(title: 'SASS Book', description: 'learn CSS with SASS', price: 19.99, published: true)
