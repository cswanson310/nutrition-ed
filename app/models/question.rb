class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_one :correct_answer, class_name: 'Answer'

end
