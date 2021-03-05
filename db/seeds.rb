# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando produtos"
Product.find_or_create_by!(name: "Café", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Desodorante", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Granola", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Shampoo", shared: true, category: "Higiene Pessoal")

puts 'Criando usuario'
User.find_or_create_by!(name: "Daniel")
User.find_or_create_by!(name: "Jose")