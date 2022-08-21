module Transactions
  class ListTransactions
    attr_accessor :transactions, :guidelines

    def initialize(transactions = {}, guidelines = {})
      self.transactions = transactions
      self.guidelines = guidelines
    end

    def call
      transactions.map do |transaction|
        data_line(
          transaction[:name],
          transaction[:cpf],
          transaction[:state],
          transaction[:value]
        )
      end * ""
    end

    private

    def data_line(name, cpf, state, value)
      "#{name}#{mount(cpf, guidelines["cpf"])}#{mount(state, guidelines["state"])}#{mount(value, guidelines["value"])}\n"
    end

    def mount(value, guides)
      return value if guides.nil?
      value = value.to_s
      length = guides["length"]
      align = guides["align"]
      padding = guides["padding"]
      
      case align
      when 'right'
        value = value.chars.last(length.to_i) * ""
      when 'left'
        value = value.chars.first(length.to_i) * ""
      end

      value = value.chars

      if value.count <= length
        (length - value.count).times do |char|
          case padding
          when 'spaces'
            value << " "
          when 'zeroes'
            value << "0"
          end
        end
      end

      value * ""
    end
  end
end
