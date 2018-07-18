class RemoveColumnsFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :categories
    remove_column :restaurants, :transactions
  end
end
