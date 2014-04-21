class AddAnswerToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :correct_answer_id, :integer
  end
end
