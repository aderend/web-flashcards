class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :username, null: false, limit: 50
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
