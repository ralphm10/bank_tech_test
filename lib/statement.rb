require_relative 'account'

class Statement
  HEADER = 'date || credit || debit || balance'.freeze

  attr_reader :transactions, :deposits, :withdrawals

  def initialize
    @transactions = []
    @deposits = []
    @withdrawals = []
  end

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    format('%<amount>.2f', amount: amount)
  end

  def calculate_balance
    @deposits.sum - @withdrawals.sum
  end

  def record_deposit(amount)
    @deposits.push(amount)
    @transactions.push("#{format_date} || #{format_amount(amount)} || || #{format_amount(calculate_balance)}")
  end

  def record_withdrawal(amount)
    @withdrawals.push(amount)
    @transactions.push("#{format_date} || || #{format_amount(amount)} || #{format_amount(calculate_balance)}")
  end

  def print_statement
    puts HEADER
    @transactions.reverse.each do |transaction|
      puts transaction
    end
  end
end
