require 'csv'
require 'set'

#delete all previous skills
Skill.all.each do |skill|
  skill.questions.clear
end

skills = Set.new
count = 0

CSV.foreach("#{Rails.root}/db/fixtures/Questions.csv") do |row|
  if $. > 1 && row.first != nil then
    count += 1
    id = count
    Question.seed do |s|
      s.id = id
      s.prompt = row.first
      s.difficulty = row.second.to_i
      s.hint = row.third
      s.correct_answer_id = (id-1)*4 + 1
    end
    Answer.seed(:id,
      {id: (id-1)*4 + 1, question_id: id, answer_text: row[3]},
      {id: (id-1)*4 + 2, question_id: id, answer_text: row[4], hint: row[5]},
      {id: (id-1)*4 + 3, question_id: id, answer_text: row[6], hint: row[7]},
      {id: (id-1)*4 + 4, question_id: id, answer_text: row[8], hint: row[9]},
    )
    if (!skills.include?(row[10])) then
      Skill.seed do |s|
        s.id = skills.size + 1
        s.name = row[10]
      end
      skills.add(row[10])
    end
    Skill.find_by_name(row[10]).questions << Question.find(id)
  end
end


