#
# User.create!(user_name:  "LidiBidi",
#               email: "admin@pauhanachi.com",
#               birthdate:"1987-01-28",
#               password:              "chicago",
#               password_confirmation: "chicago",
#               admin: true)
#
# 50.times do |n|
#   user_name  = Faker::Internet.user_name
#   birthdate = Faker::Date.backward(14)
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(user_name:  user_name,
#                 birthdate: birthdate,
#                 email: email,
#                 password:              password,
#                 password_confirmation: password)
# end

50.times do |n|
  bar_name  = Faker::Lorem.word
  address  = Faker::Address.street_address
  city  = "Chicago"
  zipcode  = "60612"
  neighborhood  = "River North"
  phone = Faker::PhoneNumber.phone_number
  website = "www.pauhana.com"
  # special_description = "Cheap craft beer"
  # day = "Thursday",
  # start_time = "5:00:PM",
  # end_time = "7:00:PM"
  Bar.create!(bar_name:  bar_name,
                address:  address,
                city: city,
                zipcode: zipcode,
                neighborhood: neighborhood,
                phone: phone,
                website: website)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
