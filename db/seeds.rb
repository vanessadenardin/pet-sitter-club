# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
begin
    pet_sitter = User.find(1)
rescue
    pet_sitter = User.create(email: "v@v.com", first_name: "Vanessa", last_name: "Denardin", password: "vanessa", password_confirmation: "vanessa", role: "pet_sitter")
end

begin
    client = User.find(2)
rescue => exception
    client = User.create(email: "c@c.com", first_name: "Caio", last_name: "Trevisan", password: "caio123", password_confirmation: "caio123", role: "client") 
end

pet_type = PetType.create(pet_type_name: "cat")
pet_type2 = PetType.create(pet_type_name: "dog")
Pet.create(client_id: client.id, pet_types_id: pet_type.id, name: "guri", age: 5)

service = Service.create(name: "Litter box cleaning", description: "testtestes", price: 50.00, )
service2 = Service.create(name: "Feed", description: "feed animals", price: 100.00, )
pet_sitter_service = PetSitterService.create(pet_sitter_id: pet_sitter.id, service_id: service.id, active: true)
pet_sitter_service2 = PetSitterService.create(pet_sitter_id: pet_sitter.id, service_id: service2.id, active: true)
order = Order.create(client_id: client.id, pet_sitter_id: pet_sitter.id)
OrderService.create(order_id: order.id, pet_sitter_service_id: pet_sitter_service.id)
OrderService.create(order_id: order.id, pet_sitter_service_id: pet_sitter_service2.id)

payment = Payment.create(order_id: order.id, total_amount: 100.00, payment_reference: "test")

review = Review.create(order_id: order.id, client_id: client.id, pet_sitter_id: pet_sitter.id, review: "oioioioioioi", rating: 5, date: "1/6/2021")
