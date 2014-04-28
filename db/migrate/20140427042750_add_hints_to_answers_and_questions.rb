class AddHintsToAnswersAndQuestions < ActiveRecord::Migration
  def change
    add_column :answers, :hint, :string
    add_column :questions, :hint, :string
  end
end
