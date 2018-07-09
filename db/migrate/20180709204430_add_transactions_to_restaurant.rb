class AddTransactionsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :transactions, :text, array:true, default: []
  end
end
