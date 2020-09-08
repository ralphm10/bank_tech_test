require_relative 'account'

class Statement
  HEADER = 'date || credit || debit || balance'.freeze

  def print_statement(transaction_log)
    puts HEADER
    transaction_log.transactions.reverse.each do |transaction|
      puts transaction
    end
  end
end
