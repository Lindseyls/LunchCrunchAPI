class Restaurant < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :popular_times

  # validates :yelp_id, :name, :image_url, :rating, :price, :location, :coordinates, :distance, presence: true

  def self.create_with_times(restaurant_params)
    yelp_id = restaurant_params[:yelp_id]
    name = restaurant_params[:name]
    image = restaurant_params[:image_url]
    yelp_url = restaurant_params[:url]
    review_count = restaurant_params[:review_count]
    categories = restaurant_params[:categories]
    rating = restaurant_params[:rating]
    price = restaurant_params[:price]
    location = restaurant_params[:location]
    coordinates = restaurant_params[:coordinates]
    distance = restaurant_params[:distance]
    phone = restaurant_params[:display_phone]
    popular_times = restaurant_params[:popular_times]

    restaurant = Restaurant.create(
      yelp_id: yelp_id,
      name: name,
      image: image,
      yelp_url: yelp_url,
      review_count: review_count,
      categories: categories,
      rating: rating,
      price: price,
      location: location,
      coordinates: coordinates,
      distance: distance,
      phone: phone
    )
    popular_times.each do |time|
      PopularTime.create(wait_time: time[:wait_time], total_time_spent: time[:total_time_spent], restaurant_id: restaurant.id)
    end

    return restaurant
  end

  def coordinates
    return {latitude: self.latitude, longitude: self.longitude}
  end

  def coordinates=(coordinates)
    self.latitude = coordinates["latitude"]
    self.longitude = coordinates["longitude"]
  end
end
