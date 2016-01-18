class RemoveColumnFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :pax, :integer
  end
end
