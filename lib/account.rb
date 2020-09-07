class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def formatted_amount(amount)
    format('%<amount>.2f', amount: amount)
  end

  def display_balance
    formatted_amount(@balance)
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @transactions.reverse.each do |transaction|
      puts transaction
    end
  end

  def deposit(amount, date)
    @balance += amount
    make_deposit(amount, date)
  end

  def make_deposit(amount, date)
    @transactions.push("#{date} || #{formatted_amount(amount)} || || #{display_balance}")
  end

  def withdraw(amount, date)
    @balance -= amount
    make_withdrawal(amount, date)
  end

  def make_withdrawal(amount, date)
    @transactions.push("#{date} || || #{formatted_amount(amount)} || #{display_balance}")
  end
end
