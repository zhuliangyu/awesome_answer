# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456")

end


50.times do
  Question.create(title: Faker::Name.name, body: Faker::Address.street_address,user:User.all.sample)


end

question_arr=Question.all


50.times do
  Answer.create(body: Faker::Address.street_address, question: question_arr.sample,user:User.all.sample)


end


