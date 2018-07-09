class AddLocationToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :location, :text, array:true, default: []
  end
end
