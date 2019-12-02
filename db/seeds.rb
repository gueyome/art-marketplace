# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
Category.destroy_all
Cart.destroy_all
CartDetail.destroy_all
Order.destroy_all
OrderDetail.destroy_all
Contact.destroy_all
PrivateMessage.destroy_all
Testimonial.destroy_all

10.times do |index|
  u = User.create(username: Faker::JapaneseMedia::OnePiece.character, first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@yopmail.com", password: "xaxaxa")
  a = Artwork.create(name: Faker::Music::Opera.verdi, description: Faker::Lorem.sentence(word_count: 28, supplemental: true, random_words_to_add: 29), price: Faker::Number.decimal(l_digits: 2), stock: Faker::Number.between(from: 1, to: 15), creator: Faker::Boolean.boolean(true_ratio: 0.2), category_id: Faker::Number.within(range: 1..10), artist_id: Faker::Number.within(range: 1..10) )
  c = Category.create(name: Faker::IndustrySegments.industry)
  cr = Cart.create(customer_id: Faker::Number.between(from: 1, to: 10))
  crd = CartDetail.create(artwork_id: Faker::Number.between(from: 1, to: 15), quantity: Faker::Number.between(from: 1, to: 3), cart_id: Faker::Number.between(from: 1, to: 10))
  o = Order.create(customer_id: Faker::Number.between(from: 1, to: 10), date: Faker::Date.in_date_period)
  od = OrderDetail.create(artwork_id: Faker::Number.between(from: 1, to: 10), quantity: Faker::Number.between(from: 1, to: 3), order_id: Faker::Number.between(from: 1, to: 10))
end


10.times do |testimonial|
    ctc = Contact.create(address: Faker::Address.full_address, latitude: Faker::Address.latitude, description: Faker::Lorem.paragraphs(number: 1, supplemental: true), longitude: Faker::Address.longitude, phone: Faker::PhoneNumber.cell_phone_with_country_code, user_id: Faker::Number.between(from: 1, to: 10))
end 

100.times do |private|
  pm = PrivateMessage.create(sender_id: Faker::Number.between(from: 1, to: 10), receiver_id: Faker::Number.between(from: 1, to: 10), content: Faker::Quote.matz)
end 

30.times do |testimonial|
  t = Testimonial.create(artist_id: Faker::Number.between(from: 1, to: 10), customer_id: Faker::Number.between(from: 1, to: 10), content: Faker::Lorem.paragraphs(number: 1))
end 