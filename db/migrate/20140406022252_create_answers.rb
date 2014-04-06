class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.string :answer_text

      t.timestamps
    end
  end
end
