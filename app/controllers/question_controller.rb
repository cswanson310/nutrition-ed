class QuestionController < ApplicationController
  before_action :set_question, only: [:show]
  before_action :set_user, only: [:show]

  def show
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
