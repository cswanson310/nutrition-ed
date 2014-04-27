class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :correct_answer, class_name: 'Answer'
  has_and_belongs_to_many :skills

end
