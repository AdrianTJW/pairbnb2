class RemoveColumnFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :user_id, :string
    remove_column :purchases, :reservation_id, :string
  end
end
