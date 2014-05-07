class ApiController < ApplicationController
  before_action :set_question, only: [:choose_answer, :next_question]

  include QuestionHelper

  def choose_answer
    #if it's correct
    if (params[:answer_id].to_i == @question.correct_answer_id) then
      correct = true
      update_skills(+1)
    else
      correct = false
      update_skills(-1)
      #try to find a hint, first by answer, then by question
      if (Answer.find_by_id(params[:answer_id]) and Answer.find(params[:answer_id]).hint) then
        hint = Answer.find(params[:answer_id]).hint
      elsif @question.hint then
        hint = @question.hint
      end
    end

    respond_to do |format|
      format.json { render json: {correct: correct, hint: hint} }
    end
  end

  def next_question
    respond_to do |format|
      # next_question_url included from QuestionHelper
      format.json { render json: {url: next_question_url } }
    end
  end

  private

  def update_skills(delta)
    users_skills = current_user.user_skills.map(&:skill_id)
    question_skills = @question.skills.map(&:id)
    overlap_skills = users_skills & question_skills
    overlap_skills.each do |skill_id|
      user_skill = current_user.user_skills.where(skill_id: skill_id).first #there is exactly 1 here
      if (user_skill.level > user_skill.min_level and
          user_skill.level < user_skill.max_level)
        user_skill.update_attribute(:level, user_skill.level + delta)
      end
    end

  end

  def set_question
    @question = Question.find(params[:id])
  end
end
