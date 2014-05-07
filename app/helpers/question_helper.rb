module QuestionHelper
  def next_question_url
    # returns a list of [level, skill_id]
    my_skills = current_user.user_skills.map{|us| [us.level, us.skill_id]} 
    worst_skill_level, worst_skill_id = my_skills.min
    possible_questions = Skill.find(worst_skill_id).questions
    next_q = possible_questions.bsearch{|q| q.difficulty >= worst_skill_level}
    if next_q then
      return question_path(next_q)
    else
      return question_path(possible_questions.select{|q| q.difficulty < worst_skill_level}.shuffle.first)
    end
  end

  def progress
    skills = current_user.user_skills
    return skills.map(&:level).sum*1.0/skills.map(&:max_level).sum
  end
end
