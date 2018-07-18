class TransactionsController < ApplicationController

  def index
    transactions = Tranaction.all;
    render json: {status: 'SUCCESS', message: 'Loaded transactions', data: transactions }, status: :ok
  end

  def show
    transaction = Tranaction.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded transaction', data: transaction }, status: :ok
  end
end
