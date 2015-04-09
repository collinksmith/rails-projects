# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

800.times do |n|
    a = Account.new
    a.name =  Faker::Company.name + " " + Faker::Company.suffix
    a.email =  Faker::Internet.email 
    a.city = Faker::Address.city 
    a.zipcode  = Faker::Address.zip_code
    a.state = Faker::Address.state_abbr
    a.about =  Faker::Company.catch_phrase
    a.type = 'Customer'
    a.employees = (rand * 90).to_i

    a.save
end