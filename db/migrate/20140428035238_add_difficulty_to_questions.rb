class AddDifficultyToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :difficulty, :integer, null: false, default: 5
  end
end
