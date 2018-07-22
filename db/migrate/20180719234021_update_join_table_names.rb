class UpdateJoinTableNames < ActiveRecord::Migration[5.2]
  def change
    rename_table :cateories_restaurants_joins, :cateories_restaurants
    rename_table :restaurants_transactions_joins, :restaurants_transactions
  end
end
