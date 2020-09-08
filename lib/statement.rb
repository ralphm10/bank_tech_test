require_relative 'account'

class Statement
  HEADER = 'date || credit || debit || balance'.freeze

  def print_statement(account)
    puts HEADER
    account.transactions.reverse.each do |transaction|
      puts transaction
    end
  end
end
