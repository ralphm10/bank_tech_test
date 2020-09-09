require_relative 'statement'
require_relative 'transaction_log'

class Account
  attr_reader :balance, :transaction_log

  def initialize(transaction_log = TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def format_amount(amount)
    format('%<amount>.2f', amount: amount)
  end

  def check_amount(amount)
    raise 'Incorrect input, try again' if amount <= 0
  end

  def deposit(amount, date)
    check_amount(amount)
    @balance += amount
    @transaction_log.record_deposit(format_amount(amount), date, format_amount(@balance))
  end

  def withdraw(amount, date)
    check_amount(amount)
    @balance -= amount
    @transaction_log.record_withdrawal(format_amount(amount), date, format_amount(@balance))
  end
end
