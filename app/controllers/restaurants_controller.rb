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
      ], include: :popular_times), status: :ok
  end

  def show
    restaurant = Restaurant.find_by(id: params[:id])

    if restaurant
      render json: restaurant.as_json(only: [
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
    else
      render json: {ok: false, :errors => "Restaurant not found"}, status: :not_found
    end
  end

  def create
    restaurant = Restaurant.create_with_times(restaurant_params)

    if restaurant.valid?
      render json: {id: restaurant.id}, status: :ok
    else
      render json: {ok: false, cause: "validation errors", errors: restaurant.errors}, status: :bad_request
    end
  end

  private

  def restaurant_params
    return params.permit(:yelp_id, :name, :image_url, :categories, :rating, :price, :location, :coordinates, :distance, :transactions, popular_times: [:wait_time, :total_time_spent])
  end

end
