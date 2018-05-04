# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# bob = User.create({username: "bob"})
# ed = User.create({username: "ed"})
# fred = User.create({username: "fred"})
# 
# Poll.destroy_all
# poll1 = Poll.create({title: "Lost", author_id: 1})
# poll2 = Poll.create({title: "Random", author_id: 2})
# 
# Question.destroy_all
# question1 = Question.create({text: "Where am I?", poll_id: 1})
# question2 = Question.create({text: "Who dat?", poll_id: 2})
# question3 = Question.create({text: "Sup?", poll_id: 2})
# question4 = Question.create({text: "Bicken back bein bool?", poll_id: 2})
# 
# AnswerChoice.destroy_all
# answer1 = AnswerChoice.create({text: "In the pit", user_id: 1, question_id: 1})
# answer2 = AnswerChoice.create({text: "It me", user_id: 2, question_id: 2})
# answer3 = AnswerChoice.create({text: "nothin", user_id: 3, question_id: 3})
# answer4 = AnswerChoice.create({text: "Cs up", user_id: 1, question_id: 4})
# 
# Response.destroy_all
# response1 = Response.create({user_id: 1, question_id: 4})
# response1 = Response.create({user_id: 2, question_id: 3})

ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all

  u1 = User.create!(username: 'Markov')
  u2 = User.create!(username: 'Gizmo')

  p1 = Poll.create!(title: 'Cats Poll', author_id: u1.id)

  q1 = Question.create!(text: 'What Cat Is Cutest?', poll_id: p1.id)
  ac1 = AnswerChoice.create!(text: 'Markov', question_id: q1.id, user_id: 1)
  ac2 = AnswerChoice.create!(text: 'Curie', question_id: q1.id, user_id: 1)
  ac3 = AnswerChoice.create!(text: 'Sally', question_id: q1.id, user_id: 1)

  q2 = Question.create!(text: 'Which Toy Is Most Fun?', poll_id: p1.id)
  ac4 = AnswerChoice.create!(text: 'String', question_id: q2.id, user_id: 1)
  ac5 = AnswerChoice.create!(text: 'Ball', question_id: q2.id, user_id: 1)
  ac6 = AnswerChoice.create!(text: 'Bird', question_id: q2.id, user_id: 1)

  r1 = Response.create!(
    user_id: u2.id,
    question_id: ac3.id
  )
  r2 = Response.create!(
    user_id: u2.id,
    question_id: ac4.id
  )
end
