class CategoriesController < ApplicationController

  def index
    categories = Category.all;
    render json: {status: 'SUCCESS', message: 'Loaded categories', data: categories }, status: :ok
  end

  def show
    category = Category.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded category', data: category }, status: :ok
  end
end
