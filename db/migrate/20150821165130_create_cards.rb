class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false, limit: 500
      t.string :answer, null: false, limit: 100
      t.boolean :passed, default: false
      t.integer :deck_id

      t.timestamps null: false
    end
  end
end
