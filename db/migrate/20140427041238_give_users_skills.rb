class GiveUsersSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.belongs_to :user
      t.belongs_to :skill
      t.integer :level, default: 6
      t.integer :max_level, default: 10
      t.integer :min_level, default: 1
      t.timestamps
    end

    add_index :user_skills, :skill_id
    add_index :user_skills, :user_id
  end
end
