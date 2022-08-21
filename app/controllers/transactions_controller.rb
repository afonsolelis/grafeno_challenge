class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show ]

  def index
    render json: Transactions::ListTransactions.new(
      Transaction.all
    ).call
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def print_with_guidelines

  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:name, :cpf, :state, :value)
    end
end
