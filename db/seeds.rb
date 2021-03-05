# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
5.times do
    Owner.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name,
        email: Faker::Internet.free_email, 
        phone_number: Faker::PhoneNumber.phone_number,
    )
end 

10.times do
    Dog.create(
        owner_id: rand(1..6),
        name: Faker::Dog.name,
        age: Faker::Number.number(1),
        weight: Faker::Number.number(1),
    )
end 

I18n.locale = 'en-US'
50.times do
    Meal.create(
        dog_id: rand(1..11),
        brand: Faker::Company.name,
        quantity: Faker::Number.number(1),
        finished: [true, false].sample,
        # finished_on: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    )
end 