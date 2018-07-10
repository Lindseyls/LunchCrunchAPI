class Restaurant < ApplicationRecord
  has_many :popular_times
  validates :yelp_id, :name, :image_url, :categories, :rating, :price, :location, :coordinates, :distance, presence: true

  def total_time_spent
    return self.popular_times.total_time_spent += self.popular_times.wait_time
  end

  def self.create_with_times(restaurant_params)
    yelp_id = restaurant_params[:yelp_id]
    name = restaurant_params[:name]
    image = restaurant_params[:image_url]
    rating = restaurant_params[:rating]
    price = restaurant_params[:price]
    coordinates = restaurant_params[:coordinates]
    distance = restaurant_params[:distance]
    popular_times = restaurant_params[:popular_times]

    restaurant = Restaurant.create(yelp_id: yelp_id, name: name, image: image, categories: categories, rating: rating, price: price, coordinates: coordinates, distance: distance)
    popular_times.each do |time|
      PopularTime.create(wait_time: time[:wait_time], total_time_spent: time[:total_time_spent], restaurant_id: restaurant.id)
    end

    return restaurant
  end
end
