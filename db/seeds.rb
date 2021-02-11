# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Favorite.destroy_all
User.destroy_all
Activity.destroy_all

kat = User.create(name: "Kat")
raz = User.create(name: "Raz")

climbing = Activity.create(
    name: "Climbing", 
    accessibility: 4.2,
    participants: 1,
    price: 5.12,
    key: 1234567,
    activity_type: "recreational"
)
kickboxing = Activity.create(
    name: "kick-boxing", 
    accessibility: 3.7,
    participants: 2,
    price: 6.9,
    key: 1234568,
    activity_type: "recreational"
)

favorite1 = Favorite.create(user: kat, activity: climbing)
favorite2 = Favorite.create(user: raz, activity: kickboxing)