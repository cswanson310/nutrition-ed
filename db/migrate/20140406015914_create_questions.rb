class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :prompt

      t.timestamps
    end
  end
end
