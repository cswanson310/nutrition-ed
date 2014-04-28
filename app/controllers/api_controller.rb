class ApiController < ApplicationController
  before_action :set_question, only: [:choose_answer]

  include QuestionHelper

  def choose_answer
    if (params[:answer_id].to_i == @question.correct_answer_id) then
      correct = true
    else
      correct = false
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
      format.json { render json: {url: next_question_url() } }
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
