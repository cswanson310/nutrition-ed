class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :hashed_password, null: false
      t.string :slug #for friendly id stuff

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :slug
  end
end
