# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating admin"
User.create(email: "user@email.com", password: "password", password_confirmation: "password")
puts "Setting admin"
User.find_by(email: "user@email.com").update_attribute(:role, "admin")