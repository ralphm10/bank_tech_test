require_relative 'account'

class Statement
  HEADER = 'date || credit || debit || balance'.freeze

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

  def record_deposit(amount, balance)
    @transactions.push("#{format_date} || #{amount} || || #{balance}")
  end

  def record_withdrawal(amount, balance)
    @transactions.push("#{format_date} || || #{amount} || #{balance}")
  end

  def print_statement
    puts HEADER
    @transactions.reverse.each do |transaction|
      puts transaction
    end
  end
end
