class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :reservation_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :purchases, [:reservation_id, :user_id], unique: true
  end
end
