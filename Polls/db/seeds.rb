# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times { User.create!(user_name: Faker::Internet.user_name) }

10.times { Poll.create!(title: Faker::Lorem.sentence,
                        author_id: rand(1..50)) }

40.times { Question.create!(text: Faker::Lorem.sentence,
                            poll_id: rand(1..10)) }

120.times { AnswerChoice.create!(answer: Faker::Lorem.sentence(1),
                                 question_id: rand(1..40)) }

120.times { |i| Response.create!(user_id: (i % 50) + 1, answer_choice_id: i+1) }
