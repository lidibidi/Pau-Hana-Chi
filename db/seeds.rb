User.destroy_all

User.create([
  {user_name:  "LidiBidi",
    email: "admin@pauhanachi.com",
    birthdate:"1987-01-28",
    password:              "chicago",
    password_confirmation: "chicago",
    admin: true},

{user_name:  "Limasan",
  email: "lidia@pauhanachi.com",
  birthdate:"1987-01-28",
  password:              "chicago",
  password_confirmation: "chicago",
  admin: false}
  ])

  
Bar.destroy_all

Bar.create([
  {bar_name:  "Theory",
    address:  "9 W. Hubbard St",
    city: "Chicago IL",
    zipcode: "60610",
    neighborhood: "River North",
    phone: "312-644-0004",
    website: "www.pauhanachi.com",
    latitude: "41.8898321",
    longitude:"-87.6307328"},

  {bar_name:  "Hub 51",
    address:  "51 W. Hubbard St",
    city: "Chicago IL",
    zipcode: "60610",
    neighborhood: "River North",
    phone: "312-828-0051",
    website: "www.pauhanachi.com",
    latitude: "41.889869",
    longitude:"-87.6342736"},

  {bar_name:  "Rock Bottom Brewery",
    address:  "1 W. Grand Ave",
    city: "Chicago IL",
    zipcode: "60640",
    neighborhood: "River North",
    phone: "312-755-9339",
    website: "www.pauhanachi.com",
    latitude: "41.8988628",
    longitude:"-87.6373906"},

  {bar_name:  "Jake Melnicks Corner Tap ",
    address:  "41 E. Superior St",
    city: "Chicago IL",
    zipcode: "60611",
    neighborhood: "River North",
    phone: "312-266-0400",
    website: "www.pauhanachi.com",
    latitude: "41.8941211",
    longitude:"-87.6324249"},

    {bar_name:  "Blue Frog's Local 22 ",
      address:  "22 E Hubbard St",
      city: "Chicago IL",
      zipcode: "60611",
      neighborhood: "River North",
      phone: "312-527-1200",
      website: "www.pauhanachi.com",
      latitude: "41.8902363",
      longitude:"-87.6315253"},

      {bar_name:  "Rossi's ",
        address:  "412 N. State St",
        city: "Chicago IL",
        zipcode: "60654",
        neighborhood: "River North",
        phone: "312-644-5775",
        website: "www.pauhanachi.com",
        latitude: "41.8897592",
        longitude:"-87.6325778"},
])




              phone: phone,
              website: website)

50.times do |n|
  user_name  = Faker::Internet.user_name
  birthdate = Faker::Date.backward(14)
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(user_name:  user_name,
                birthdate: birthdate,
                email: email,
                password:              password,
                password_confirmation: password)
end

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
