class Account
  attr_reader :balance, :transaction, :transaction_log

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
    puts 'date || credit || debit || balance'
    @transaction.reverse.each do |transaction|
      puts transaction
    end
  end

  def deposit(amount, date)
    @balance += amount
    @transaction.push("#{date}" + " || " + "#{formatted_amount(amount)}" + " || || " + "#{display_balance}")
  end

  def withdraw(amount, date)
    @balance -= amount
    @transaction.push("#{date}" + " || || " + "#{formatted_amount(amount)}" + " || " + "#{display_balance}")
  end
end
