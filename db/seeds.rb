# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Info.create!(title: "Hello excalibur", content: "An content management system，simple and practical")

66.times do |n|
	title = Faker::Name.name
	content = Faker::Internet.email
	Info.create!(title: title, content: content)
end
