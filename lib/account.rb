class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def display_balance
    format '%.2f', @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
