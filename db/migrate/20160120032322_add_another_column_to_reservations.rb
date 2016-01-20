class AddAnotherColumnToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :paid_status, :string
  end
end
