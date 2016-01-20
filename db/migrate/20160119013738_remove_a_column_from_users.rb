class RemoveAColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :price, :string
  end
end
