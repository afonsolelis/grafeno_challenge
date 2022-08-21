class PrintWithGuidelinesController < ApplicationController
  def index
    render json: Transactions::ListTransactions.new(
      Transaction.all,
      guideline_params
    ).call
  end

  private

  def guideline_params
    params.permit(:name, :cpf, :state, :value)
  end
end
