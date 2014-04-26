Question.seed(:id,
  {id: 1, prompt: 'Which of the following is a food group?', correct_answer_id: 3} #fruits
)

Answer.seed(:id,
  {id: 1, question_id: 1, answer_text: "beans"},
  {id: 2, question_id: 1, answer_text: "sweets"},
  {id: 3, question_id: 1, answer_text: "fruits"},
  {id: 4, question_id: 1, answer_text: "milk"}
)

