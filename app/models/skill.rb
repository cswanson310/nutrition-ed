class Skill < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_many :user_skills
  has_many :users, through: :user_skills
end
