class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null:false, limit: 500
      t.integer :number_of_cards
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
