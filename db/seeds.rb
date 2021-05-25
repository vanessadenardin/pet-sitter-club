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
    pet_sitter = User.create(email: "v@v.com", first_name: "Vanessa", last_name: "Denardin", password: "vanessa", password_confirmation: "vanessa", role: "pet_sitter", post_code: 3000, admin: true)
end

begin
    client = User.find(2)
rescue => exception
    client = User.create(email: 'c@c.com', first_name: 'Caio', last_name: 'Trevisan', password: 'caio123', password_confirmation: 'caio123', role: 'client', post_code: 3000) 
end

begin
    pet_sitter2 = User.find(3)
rescue => exception
    pet_sitter2 = User.create(email: 'p@p.com', first_name: 'Pet', last_name: 'Sitter', password: 'vanessa', password_confirmation: 'vanessa', role: 'pet_sitter', post_code: 3000) 
end

pet_type = PetType.create(pet_type_name: 'cat')
pet_type2 = PetType.create(pet_type_name: 'dog')
Pet.create(client_id: client.id, pet_types_id: pet_type.id, name: 'Guri', age: 5)
Pet.create(client_id: client.id, pet_types_id: pet_type.id, name: 'Tas', age: 1)

service = Service.create(name: 'Dog sitting', description: 'Play with your dog for 30 minutes.', price: 150.00)
service2 = Service.create(name: 'Cat sitting', description: 'Play with your cat for 30 minutes.', price: 150.00)
service3 = Service.create(name: 'Dog walk', description: 'Walk with your dog for 30 minutes.', price: 250.00)
service4 = Service.create(name: 'Pet day care', description: 'Take care of your loved pet for a whole day', price: 350.00)

# pet_sitter1
pet_sitter_service = PetSitterService.create(pet_sitter_id: pet_sitter.id, service_id: service.id, active: true)
pet_sitter_service2 = PetSitterService.create(pet_sitter_id: pet_sitter.id, service_id: service2.id, active: true)

# pet_sitter2
pet_sitter_service3 = PetSitterService.create(pet_sitter_id: pet_sitter2.id, service_id: service3.id, active: true)
pet_sitter_service4 = PetSitterService.create(pet_sitter_id: pet_sitter2.id, service_id: service4.id, active: true)

# order = Order.create(client_id: client.id, pet_sitter_id: pet_sitter.id)
# OrderService.create(order_id: order.id, pet_sitter_service_id: pet_sitter_service.id)
# OrderService.create(order_id: order.id, pet_sitter_service_id: pet_sitter_service2.id)

# payment = Payment.create(order_id: order.id, total_amount: 100.00, payment_reference: 'test')

# review = Review.create(order_id: order.id, client_id: client.id, pet_sitter_id: pet_sitter.id, review: 'oioioioioioi', rating: 5, date: "1/6/2021")
