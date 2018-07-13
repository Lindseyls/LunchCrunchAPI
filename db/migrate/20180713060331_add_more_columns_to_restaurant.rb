class AddMoreColumnsToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :yelp_url, :string
    add_column :restaurants, :review_count, :integer
    add_column :restaurants, :display_phone, :string
    change_column :restaurants, :rating, :float
    change_column :restaurants, :distance, :float
  end
end
