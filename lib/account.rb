require_relative 'statement'

class Account
  attr_reader :balance, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def format_amount(amount)
    format('%<amount>.2f', amount: amount)
  end

  def check_amount(amount)
    raise 'Incorrect input, try again' if amount <= 0
  end

  def deposit(amount)
    check_amount(amount)
    @balance += amount
    @statement.record_deposit(format_amount(amount), format_amount(@balance))
  end

  def withdraw(amount)
    check_amount(amount)
    @balance -= amount
    @statement.record_withdrawal(format_amount(amount), format_amount(@balance))
  end
end
