# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando produtos"

Product.find_or_create_by!(name: "Detergente", shared: true, category: "Limpeza")
Product.find_or_create_by!(name: "Amaciante", shared: true, category: "Limpeza")
Product.find_or_create_by!(name: "Sabão Lava Roupas", shared: true, category: "Limpeza")

Product.find_or_create_by!(name: "Café", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Granola", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Carne Bovina", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Carne Suína", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Carne de Frango", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Maçã", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Banana", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Cerveja", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Leite", shared: true, category: "Alimento")
Product.find_or_create_by!(name: "Yakult", shared: true, category: "Alimento")

Product.find_or_create_by!(name: "Pasta de Dente", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Escova de Dente", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Papel Higiênico", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Desodorante", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Shampoo", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Sabonete", shared: true, category: "Higiene Pessoal")
Product.find_or_create_by!(name: "Condicionador", shared: true, category: "Higiene Pessoal")
