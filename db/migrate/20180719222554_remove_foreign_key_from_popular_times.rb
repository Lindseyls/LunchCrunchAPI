class RemoveForeignKeyFromPopularTimes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :popular_times, :restaurants
  end
end
