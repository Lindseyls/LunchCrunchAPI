class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id
      t.string :name
      t.string :image_url
      t.integer :rating
      t.string :price
      t.integer :distance

      t.timestamps
    end
  end
end
