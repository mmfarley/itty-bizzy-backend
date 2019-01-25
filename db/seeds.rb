require 'faker'

Message.destroy_all
Bill.destroy_all
Client.destroy_all
Appointment.destroy_all
Business.destroy_all
User.destroy_all

meg = User.create("email": "meg@e.com", "password": "balls", "name": "Meg")
jan = User.create("email": "jan@e.com", "password": "balls", "name": "Janu")

meg.messages.create("content": "earth to jannnnnn", "messaged_user_id": jan.id)
jan.messages.create("content": "earch back to megggggg", "messaged_user_id": meg.id)
meg.messages.create("content": "hiiiiiiiiiiiiiiiiiiiiiiiiiiii", "messaged_user_id": jan.id)
jan.messages.create("content": "what up upup upup up upu p up up up up", "messaged_user_id": meg.id)

meg.bills.create("amount": 1.0, "billed_user_id": jan.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
meg.bills.create("amount": 1.0, "billed_user_id": jan.id, "due_date": "1/16/19")
meg.bills.create("amount": 1.0, "billed_user_id": jan.id, "due_date": "1/16/19")
jan.bills.create("amount": 1000.0, "billed_user_id": meg.id, "due_date": "1/16/19", "is_paid": true)
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")

meg_biz = Business.create("hourly_rate": 40.00, "service_type": "programmer", "description": "i write code and stuff. blah blah blah. you want me to code for you and stuffffff", "user_id": meg.id, "name": "meg programming")
jan_biz = Business.create("hourly_rate": 40.00, "service_type": "programmer", "description": "i write code and stuff. blah blah blah. you want me to code for you and stuffffff", "user_id": jan.id, "name": "jan programming")

services = ["Programmer", "Piano Teacher", "Nanny", "Tutor", "Maid", "Gardener", "Event Coordinator"]

fakerQuotes = [Faker::PrincessBride.quote, Faker::TheITCrowd.quote, Faker::StarWars.wookiee_sentence, Faker::StarWars.quote]

fakerConvos = [Faker::Shakespeare.hamlet_quote, Faker::Shakespeare.as_you_like_it_quote, Faker::Shakespeare.king_richard_iii_quote, Faker::Shakespeare.romeo_and_juliet_quote]

users = []

50.times do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.unique.email, password: "jjjj")
    users.push(user)
end

$i = 0
while $i < 12 do
   biz = Business.create("user_id": users[$i].id, "hourly_rate": [20, 15, 30, 40, 50].sample, "service_type": services.sample, "description": fakerQuotes.sample, "name": Faker::Science.element)
   users[$i].messages.create("messaged_user_id": meg.id, "content": fakerConvos.sample)
   meg.messages.create("messaged_user_id": users[$i].id, "content": fakerQuotes.sample)
   $i +=1
end
