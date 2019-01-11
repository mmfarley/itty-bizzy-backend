# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Bill.destroy_all
Business.destroy_all
User.destroy_all

# User.create!(email: 'meg@ex.com', password: 'balls')
meg = User.create("email": "meg@e.com", "password": "balls", "first_name": "Meg")
jan = User.create("email": "jan@e.com", "password": "balls")

meg.messages.create("content": "sending balls to jannnnnn", "messaged_user_id": jan.id)
jan.messages.create("content": "sending balls back to megggggg", "messaged_user_id": meg.id)

meg.bills.create("amount": 1.0, "billed_user_id": jan.id)
