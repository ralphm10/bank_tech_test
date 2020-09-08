require_relative 'statement'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def format_amount(amount)
    format('%<amount>.2f', amount: amount)
  end

  def display_balance
    format_amount(@balance)
  end

  def check_amount(amount)
    raise 'Incorrect input, try again' if amount <= 0
  end

  def deposit(amount, date)
    check_amount(amount)
    @balance += amount
    record_deposit(amount, date)
  end

  def record_deposit(amount, date)
    @transactions.push("#{date} || #{format_amount(amount)} || || #{display_balance}")
  end

  def withdraw(amount, date)
    check_amount(amount)
    @balance -= amount
    record_withdrawal(amount, date)
  end

  def record_withdrawal(amount, date)
    @transactions.push("#{date} || || #{format_amount(amount)} || #{display_balance}")
  end
end
