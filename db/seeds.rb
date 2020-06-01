# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ticket.destroy_all

20.times do |index|
  Ticket.create!(company: Faker::Company.name,
                departure: Faker::Time.forward(days: 60, format: :long),
                from: Faker::Address.city,
                to: Faker::Address.city,
                num_max: Faker::Number.within(range: 1..20))
end

p "Created #{Ticket.count} tickets"

User.destroy_all
User.create([{email: 'test@test.com', password: 'password'}])
p "Created #{User.count} users"

Booking.destroy_all
p "Bookings: #{Booking.count}"