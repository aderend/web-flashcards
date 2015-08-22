class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :email, null: false, limit: 50
      t.string :password_hash, null: false
      t.integer :games_completed, default: 0

      t.timestamps null: false
    end
  end
end
