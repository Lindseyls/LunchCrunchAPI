class CreatePopularTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :popular_times do |t|
      t.integer :wait_time
      t.integer :total_time_spent

      t.timestamps
    end
  end
end
