class AddCoordinatesToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :coordinates, :text
  end
end
