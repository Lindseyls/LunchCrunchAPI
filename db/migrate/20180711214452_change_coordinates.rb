class ChangeCoordinates < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :coordinates, :text
    add_column :restaurants, :latitude, :string
    add_column :restaurants, :longitude, :string
  end
end
