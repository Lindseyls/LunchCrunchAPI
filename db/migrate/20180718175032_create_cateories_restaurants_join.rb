class CreateCateoriesRestaurantsJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :cateories_restaurants_joins do |t|
      t.belongs_to :cateory, index: true
      t.belongs_to :restaurant, index: true
    end
  end
end
