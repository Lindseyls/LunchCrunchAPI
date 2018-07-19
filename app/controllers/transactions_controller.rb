class TransactionsController < ApplicationController

  def index
    transactions = Transaction.all;
    render json: {status: 'SUCCESS', message: 'Loaded transactions', data: transactions }, status: :ok
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded transaction', data: transaction }, status: :ok
  end
end
