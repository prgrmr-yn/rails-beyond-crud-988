
puts "Creating restaurants"

100.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.city, rating: rand(2..5))
  puts "Restaurant with id#{restaurant.id}"
end
