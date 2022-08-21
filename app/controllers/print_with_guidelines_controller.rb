class PrintWithGuidelinesController < ApplicationController
  def index
    render json: Transactions::ListTransactions.new(
      Transaction.all,
      params
    ).call
  end
end
