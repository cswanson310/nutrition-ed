class ApiController < ApplicationController
  before_action :set_question, only: [:choose_answer]

  include QuestionHelper

  def choose_answer
    puts params
    correct = false
    if (params[:answer_id].to_i == @question.correct_answer_id) then
      correct = true
    end

    respond_to do |format|
      format.json { render json: {correct: correct} }
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
