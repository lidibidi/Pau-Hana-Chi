
User.create!(first_name:  "The Admin",
              last_name:  "santos",
              email: "admin1@pauhana.com",
              birthdate:"1987-01-28",
              password:              "chicago",
              password_confirmation: "chicago",
              admin: true)

99.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  birthdate = Faker::Date.backward(14)
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name:  first_name,
                last_name:  last_name,
                birthdate: birthdate,
                email: email,
                password:              password,
                password_confirmation: password)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
