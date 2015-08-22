class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :deck_id
      t.integer :user_id
      t.boolean :completed, default: false
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
