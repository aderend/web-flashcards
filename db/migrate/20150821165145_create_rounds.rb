class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :deck
      t.references :user
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
