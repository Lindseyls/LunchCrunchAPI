class CreateRestaurantsTransactionsJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_transactions_joins do |t|
      t.belongs_to :restaurant, index: true
      t.belongs_to :transaction, index: true
    end
  end
end
