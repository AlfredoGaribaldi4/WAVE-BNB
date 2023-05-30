# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Board.destroy_all
User.destroy_all

puts 'Creating surfboards...'

user = User.create(email: "bob@gmail.com", password: "111111")

3.times do
  board = Board.create(category: Faker::Commerce.product_name,
    title: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price_per_day: Faker::Number.between(from: 1, to: 100),
    location: Faker::Address.city,
    user: user)
  puts "Created #{board.title}"
end

puts 'Finished!'
