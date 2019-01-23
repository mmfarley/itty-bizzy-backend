Message.destroy_all
Bill.destroy_all
Client.destroy_all
Appointment.destroy_all
Business.destroy_all
User.destroy_all

meg = User.create("email": "meg@e.com", "password": "balls", "name": "Meg")
jan = User.create("email": "jan@e.com", "password": "balls", "name": "Janu")

meg.messages.create("content": "sending balls to jannnnnn", "messaged_user_id": jan.id)
jan.messages.create("content": "sending balls back to megggggg", "messaged_user_id": meg.id)
meg.messages.create("content": "hiiiiiiiiiiiiiiiiiiiiiiiiiiii", "messaged_user_id": jan.id)
jan.messages.create("content": "what up upup upup up upu p up up up up", "messaged_user_id": meg.id)

meg.bills.create("amount": 1.0, "billed_user_id": jan.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
meg.bills.create("amount": 1.0, "billed_user_id": jan.id, "due_date": "1/16/19")
meg.bills.create("amount": 1.0, "billed_user_id": jan.id, "due_date": "1/16/19")
jan.bills.create("amount": 1000.0, "billed_user_id": meg.id, "due_date": "1/16/19", "is_paid": true)
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")
jan.bills.create("amount": 100.0, "billed_user_id": meg.id, "due_date": "1/16/19")

meg_biz = Business.create("hourly_rate": 40.00, "service_type": "programmer", "description": "i write code and stuff. blah blah blah. you want me to code for you and stuffffff", "user_id": meg.id, "name": "meg programming")
jan_biz = Business.create("hourly_rate": 40.00, "service_type": "programmer", "description": "i write code and stuff. blah blah blah. you want me to code for you and stuffffff", "user_id": jan.id, "name": "jan programming")

meg_biz.appointments.create("date":"01/22/2019", "appointment_user_id": jan.id)
meg_biz.appointments.create("date":"01/20/2019", "appointment_user_id": jan.id)
meg_biz.appointments.create("date":"01/23/2019", "appointment_user_id": jan.id)


meg_biz.clients.create("client_user_id": jan.id)

#FAKER STUFF EXAMPLE
# require 'faker'
# services_offered = ["Decoration", "Catering", "Staffing", "Venues", "Photography", "Entertainment"]
#
# decoration_photos = ["https://www.mayaflowers.com/media/wysiwyg/wedding-flowers/wedding-flowers-1.jpg", "http://citipridegarden.com/images/gallery/flower4.jpg", "https://rukminim1.flixcart.com/image/832/832/j52rrm80/balloon/r/j/j/12-happy-birthday-decoration-foil-balloon-set-of-1-birthday-original-imaevsyq2zprjjqh.jpeg?q=70", "http://hopshop.co.uk/wp-content/uploads/2016/04/Hops_Wedding_011_02101.jpg"]
# catering_photos = ["https://www.ecocaters.com/wp-content/uploads/2016/12/Simply-Lunch-the-best-office-catering-company-in-Los-Angeles.jpg", "https://rounddin-prod.s3.amazonaws.com/static/assets/images/catering-services-buffet.jpg", "https://zoeskitchen.com/images/og-share/Catering_Web.jpg"]
# staffing_photos = ["https://s3.amazonaws.com/pas-wordpress-media/content/uploads/2015/09/shutterstock_110620211-653x339.jpg", "https://sharedmedia.grahamdigital.com/photo/2017/12/12/green-living-cleaning-supplies_1513111294514_11281445_ver1.0_640_360.jpg", "https://s3.amazonaws.com/gigsalad_media/b/bay_area_event_staffing_san_francisco/5426bcc205fa8_300_sq"]
# venues_photos = ["http://www.conferences.co.za/images/sun-city-conference-venue-south-africa-fp.jpg", "http://starclientevents.com/wp-content/uploads/2017/07/venue.jpg", "https://timedotcom.files.wordpress.com/2016/12/161212_em_weddingvenue_monarch.jpg", "https://media.brides.com/photos/580e5a7fcf602c7a3153e6e5/1:1/w_767/blogs-aisle-say-rustic-wedding-venues-san-francisco-bear-flag-farm.jpg"]
# photography_photos = ["https://thriftymommaramblings.com/wp-content/uploads/2018/03/wedding-photographer.jpeg", "https://dvyvvujm9h0uq.cloudfront.net/com/articles/1515136552-blog-featured1.jpg", "https://www.partyrentalsanddecor.com/wp-content/uploads/2017/05/san-diego-event-photographer.jpg"]
# entertainment_photos = ["https://img.grouponcdn.com/deal/caf13b5ccf0441949424504a7a22cc8b/8b/v1/c700x420.jpg", "https://barsandbartending.com/wp-content/uploads/2017/04/basics-of-bartending-1.jpg", "http://cdm.link/app/uploads/2016/04/DJShifteeSetup.jpg", "https://media-api.xogrp.com/images/350dd218-ecef-456a-a4e0-5762be20f4f8~rs_768.h"]
#
# Vendor.destroy_all
# Customer.destroy_all
# Quote.destroy_all
#
# 50.times do
#     v = Vendor.create(name: Faker::Name.name, city: Faker::Address.city, state: Faker::Address.state, phone: Faker::PhoneNumber.cell_phone, service: services_offered.sample, website: Faker::Internet.url, email: Faker::Internet.email, description: Faker::Company.catch_phrase, price_range: ["$","$$","$$$","$$$$","$$$$$"].sample)
#     case v.service
#     when "Decoration"
#         v.update(logo_img: decoration_photos.sample)
#
#     when "Catering"
#         v.update(logo_img: catering_photos.sample)
#
#     when "Staffing"
#         v.update(logo_img: staffing_photos.sample)
#     when "Venues"
#         v.update(logo_img: venues_photos.sample)
#     when "Entertainment"
#         v.update(logo_img: entertainment_photos.sample)
#     when "Photography"
#         v.update(logo_img: photography_photos.sample)
#     end
# end
