require_relative 'statement'

class Account
  attr_reader :balance, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def check_amount(amount)
    raise 'Incorrect input, try again' if amount <= 0
  end

  def deposit(amount)
    check_amount(amount)
    @balance += amount
    @statement.record_deposit(amount)
  end

  def withdraw(amount)
    check_amount(amount)
    @balance -= amount
    @statement.record_withdrawal(amount)
  end
end
