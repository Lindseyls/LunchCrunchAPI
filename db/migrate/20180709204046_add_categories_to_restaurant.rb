class AddCategoriesToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :categories, :text, array:true, default: []
  end
end
