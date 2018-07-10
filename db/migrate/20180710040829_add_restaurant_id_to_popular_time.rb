class AddRestaurantIdToPopularTime < ActiveRecord::Migration[5.2]
  def change
    add_reference :popular_times, :restaurant, foreign_key: true
  end
end
