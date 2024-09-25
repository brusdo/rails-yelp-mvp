# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
restaurants = [
  {name: "Chocolate", address: "7 Boundary St, London E2 7JE", category: "belgian"},
  {name: "Rishoom", address: "7 Boundary St, London E2 7JE", category: "chinese"},
  {name: "The Bear", address: "7 Boundary St, London E2 7JE", category: "japanese"},
  {name: "Jimmy's Pizza", address: "7 Boundary St, London E2 7JE", category: "italian"},
  {name: "Slugs and Snails", address: "7 Boundary St, London E2 7JE", category: "french"},
]

restaurants.each do |attributes|
  restaurant = Restaurant.create!(attributes)
  review = Review.new(content: "yummy yummy", rating: 4)
  review.restaurant = restaurant
  review.save
  puts "Created #{restaurant.name}"
end
puts "Finished!"
