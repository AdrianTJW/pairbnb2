class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :email
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
