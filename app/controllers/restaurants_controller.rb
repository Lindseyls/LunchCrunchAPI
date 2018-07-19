class RestaurantsController < ApplicationController

  around_action :catch_api_error

  def index
    yelp_data = YelpApiWrapper.list_restaurants
    yelp_data.map do |list|
      Restaurant.create(
        yelp_id: list.id,
        name: list.name,
        image_url: list.image_url,
        yelp_url: list.url,
        review_count: list.review_count,
        # categories: list.categories,
        rating: list.rating,
        price: list.price,
        location: list.location,
        latitude: list.latitude,
        longitude: list.longitude,
        # transactions: list.transactions,
        distance: list.distance,
        display_phone: list.display_phone,
        # popular_times: [
        #   {
        #     wait_time: rand(0...30),
        #     total_time_spent: rand(0...60),
        #     restaurant_id: rand(0...50)
        #   }
        # ]
      )
    end

    @restaurants = Restaurant.all
    render json: @restaurants.as_json(except: [:created_at, :updated_at], include: :popular_times), status: :ok
  end

  def show
    restaurant = Restaurant.find_by(id: params[:id])

    if restaurant
      render json: restaurant.as_json(only: [
        :yelp_id,
        :name,
        :image_url,
        :yelp_url,
        :review_count,
        # :categories,
        :rating,
        :price,
        :location,
        :latitude,
        :longitude,
        :distance,
        :display_phone,
        # :transactions
        ]), status: :ok
      else
        render json: {ok: false, :errors => "Restaurant not found"}, status: :not_found
      end
    end

    def create
      restaurant = Restaurant.new(restaurant_params)

      if restaurant.save
        render json: restaurant.as_json(except: [:created_at, :updated_at], status: :ok)
      else
        render json: {ok: false, cause: "validation errors", errors: restaurant.errors}, status: :bad_request
      end
    end

    private

    def catch_api_error
      begin
        # This will run the actual controller action
        # Actually the same yield keyword as in
        # application.html.erb
        yield
      rescue YelpApiWrapper::YelpError => error
        flash[:status] = :failure
        flash[:message] = "API called failed: #{error}"
        redirect_back fallback_location: root_path
      end
    end

    def restaurant_params
      return params.permit(:yelp_id, :name, :image_url, :yelp_url, :review_count, :rating, :price, :location, :latitude, :longitude, :distance, :display_phone, popular_times: [:wait_time, :total_time_spent])
    end

  end
