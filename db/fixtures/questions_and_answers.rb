Question.seed(:id,
  {id: 1, prompt: 'Which of the following is a food group?', correct_answer_id: 3} #fruits
)

Answer.seed(:id,
  {id: 1, question_id: 1, answer_text: "beans"},
  {id: 2, question_id: 1, answer_text: "sweets"},
  {id: 3, question_id: 1, answer_text: "fruits"},
  {id: 4, question_id: 1, answer_text: "milk"}
)

Skill.seed(:id,
  {id: 1, name: "identifying food groups"},
  {id: 2, name: "classifying foods"},
)

#delete all previous skills
Skill.all.each do |skill|
  skill.questions.clear
end

[
  [1,1]
].each do |skill_id, question_id|
  Skill.find(skill_id).questions << Question.find(question_id)
end

