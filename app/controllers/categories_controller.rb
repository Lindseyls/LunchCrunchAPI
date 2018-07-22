class CategoriesController < ApplicationController

  def index
    yelp_data = YelpApiWrapper.list_restaurants
    yelp_data.map do |list|
      Category.create(
        name: list.categories[0]["title"]
      )
    end

    @categories = Category.all;
    render json: @categories.as_json(except: [:created_at, :updated_at]), status: :ok
  end

  def show
    category = Category.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded category', data: category }, status: :ok
  end

  def create
    category = Category.new(category_params)

    if category.save
      render json: category.as_json(except: [:created_at, :updated_at], status: :ok)
    else
      render json: {ok: false, cause: "validation errors", errors: category.errors}, status: :bad_request
    end
  end

  private

  def category_params
    return params.permit(:name)
  end

end
