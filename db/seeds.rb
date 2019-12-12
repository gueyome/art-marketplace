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


    vv = "https://cdn.pixabay.com/photo/2016/01/19/15/01/paints-1149122_1280.jpg"
    count = 0 

5.times do |index|  
    c = Category.create(name: Faker::Artist.name, url_image: vv)
    u = User.create(username: "user#{index}", first_name: "firstname#{index}", last_name: "Lastname#{index}", email: "email#{index}@yopmail.com", password: "xaxaxa")
    a = Artwork.create(name: "Artwork#{index}", description: "description#{index}", price: rand(100..1000), stock: 10, category_id: rand(c.id-count..c.id), user_id: u.id )
    ctc = Contact.create(address: "#{index}rue de Paris", latitude: index, description: "description#{index}", longitude: index, phone: "123#{index}", user_id: u.id)
    cr = Cart.create(user_id: u.id)
    o = Order.create(user_id: u.id, date: Time.now)
    pm = PrivateMessage.create(sender_id: u.id, receiver_id: User.all.first.id, content:"Content #{index}")
    t = Testimonial.create(artist_id: User.all.first.id, customer_id: u.id, content: "Content #{index}")
    crd = CartDetail.create(artwork_id: a.id, cart_id: cr.id)
    od = OrderDetail.create(artwork_id: a.id, order_id: o.id)

    count = count + 1 

    if count == 1 
        vv = "https://cdn.pixabay.com/photo/2013/07/07/01/21/blue-143734_1280.jpg"

    elsif count == 2
        vv = "https://cdn.pixabay.com/photo/2017/09/12/22/06/background-2743840_1280.jpg"

    elsif count == 3
        vv = "https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105_1280.png"

    elsif count == 4
        vv = "https://cdn.pixabay.com/photo/2017/07/23/11/46/statue-of-hercules-2531191_1280.jpg"
    end 
end 
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

