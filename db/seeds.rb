# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CartDetail.destroy_all
OrderDetail.destroy_all
Cart.destroy_all
Order.destroy_all
Contact.destroy_all
PrivateMessage.destroy_all
Testimonial.destroy_all
User.destroy_all
Artwork.destroy_all
Category.destroy_all

5.times do |index|   
    u = User.create(username: "user#{index}", first_name: "firstname#{index}", last_name: "Lastname#{index}", email: "email#{index}@yopmail.com", password: "xaxaxa")
    c = Category.create(name: "category#{index}")
    a = Artwork.create(name: "Artwork#{index}", description: "description#{index}", price: rand(100..1000), stock: 10, category_id: c.id, user_id: u.id )
    ctc = Contact.create(address: "#{index}rue de Paris", latitude: index, description: "description#{index}", longitude: index, phone: "123#{index}", user_id: u.id)
    cr = Cart.create(user_id: u.id)
    o = Order.create(user_id: u.id, date: Time.now)
    pm = PrivateMessage.create(sender_id: u.id, receiver_id: User.all.first.id, content:"Content #{index}")
    t = Testimonial.create(artist_id: User.all.first.id, customer_id: u.id, content: "Content #{index}")
    crd = CartDetail.create(artwork_id: a.id, cart_id: cr.id)
    od = OrderDetail.create(artwork_id: a.id, order_id: o.id)
end 