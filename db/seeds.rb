puts 'Cleaning Database'
Restaurant.destroy_all
puts 'Database cleaned'

puts "Creating restaurants"

100.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    rating: rand(2..5),
    chef_name: ['Peter Griffin', 'Luis Griffin', 'Meg Griffin', 'Brian Griffin', 'Stewie Griffin'].sample
  )
  puts "Restaurant with id#{restaurant.id}"
end
