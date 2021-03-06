# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JSON.parse(File.read('db/seeds/restaurants.json')).each do |restaurant|
  Restaurant.create!(restaurant)
end

JSON.parse(File.read('db/seeds/popular_times.json')).each do |time|
  PopularTime.create!(time)
end


i = 1

58.times do |i|
  PopularTime.create!(
    wait_time:rand(0...15),
    total_time_spent:rand(30...60),
    restaurant_id: i
  )
  i += 1
end
