# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all
Answer.delete_all

question = Question.new(
  {prompt: 'Which of the following is a food group?',
   correct_answer_id: 3,
  },
)

answers = [
  {question: question, answer_text: "beans", id: 1 },
  {question: question, answer_text: "sweets", id: 2 },
  {question: question, answer_text: "fruits", id: 3 },
  {question: question, answer_text: "milk", id: 4 },

].map{|args| Answer.new(args)}

question.save
answers.map{|ans| ans.save}
