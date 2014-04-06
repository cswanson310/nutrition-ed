# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


questions = Question.create([
  {prompt: 'Which of the following is a food group?',
  },
])

Answer.create([
  {question: questions.first, answer_text: "beans" },
  {question: questions.first, answer_text: "sweets" },
  {question: questions.first, answer_text: "fruits" },
  {question: questions.first, answer_text: "milk" },

])

