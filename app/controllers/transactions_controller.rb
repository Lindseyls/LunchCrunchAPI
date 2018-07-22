class TransactionsController < ApplicationController

  def index
    yelp_data = YelpApiWrapper.list_restaurants
    yelp_data.map do |list|
      Restaurant.create(
        transactions: list.transactions
      )
    end

    transactions = Transaction.all;
    render json: {status: 'SUCCESS', message: 'Loaded transactions', data: transactions }, status: :ok
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded transaction', data: transaction }, status: :ok
  end
end
