class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.integer :contact
      t.integer :pax
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps null: false
    end
  end
end
