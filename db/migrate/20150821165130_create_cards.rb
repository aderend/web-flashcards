class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false, limit: 500
      t.string :answer, null: false, limit: 100
      t.references :deck

      t.timestamps null: false
    end
  end
end
