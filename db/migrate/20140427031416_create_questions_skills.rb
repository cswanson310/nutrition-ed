class CreateQuestionsSkills < ActiveRecord::Migration
  def change
    create_table :questions_skills, id: false do |t|
      t.belongs_to :question
      t.belongs_to :skill
    end

    add_index :questions_skills, [:question_id, :skill_id]
  end
end
