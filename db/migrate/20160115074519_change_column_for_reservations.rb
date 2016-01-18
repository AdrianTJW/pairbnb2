class ChangeColumnForReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :startdate, :date
  	change_column :reservations, :enddate, :date
  end
end
