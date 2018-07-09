class RestaurantsController < ApplicationController

  def index
    restaurants = Restaurant.all
    render json: restaurants.as_json(only: [
      :yelp_id,
      :name,
      :image_url,
      :categories,
      :rating,
      :price,
      :location,
      :coordinates,
      :distance,
      :transactions
      ]), status: :ok
  end

end
