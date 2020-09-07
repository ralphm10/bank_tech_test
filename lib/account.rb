class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def display_balance
    format '%.2f', @balance
  end

  def display_transactions
    @transactions.join
  end

  def deposit(amount, date)
    @balance += amount
    formatted_amount = format '%.2f', amount
    @transactions.push(date, ' || ', formatted_amount, ' || || ', display_balance)
  end

  def withdraw(amount)
    @balance -= amount
  end
end
