# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usuario.create!(nome: "administrador FAB", email: "administrador@fab.com.br", password: "ADMINFAB", telefone: "99999999", cpf: "237.713.510-22", numero_residencia: 1, bloco_residencia: 1, isMorador: false)