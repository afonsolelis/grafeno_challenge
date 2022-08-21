module Transactions
  class ListTransactions
    attr_accessor :transactions, :guidelines

    def initialize(transactions = {}, guidelines = {})
      byebug
      self.transactions = transactions
      self.guidelines = guidelines
    end

    def call
      return print_without_guidelines unless guidelines
      print_with_guidelines
    end

    private

    def print_without_guidelines
      transactions.map do |transaction|
        "#{transaction[:name]}#{transaction[:cpf]}#{transaction[:state]}#{transaction[:value]}\n"
      end * ""
    end

    def print_with_guidelines
      "Not yet implemented"
    end
  end
end
