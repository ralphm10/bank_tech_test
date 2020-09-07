class Account
  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def formatted_amount(amount)
    format '%.2f', amount
  end

  def display_balance
    formatted_amount(@balance)
  end

  def display_transactions
    @transaction.join
  end

  def deposit(amount, date)
    @balance += amount
    @transaction.push(date, ' || ', formatted_amount(amount), ' || || ', display_balance, "\n")
  end

  def withdraw(amount, date)
    @balance -= amount
    @transaction.push(date, ' || || ', formatted_amount(amount), ' || ', display_balance, "\n")
  end
end
