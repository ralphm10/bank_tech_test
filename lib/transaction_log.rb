class TransactionLog
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def format_date
    Time.now.strftime('%d/%m/%Y')
  end

  def record_deposit(amount, balance)
    @transactions.push("#{format_date} || #{amount} || || #{balance}")
  end

  def record_withdrawal(amount, balance)
    @transactions.push("#{format_date} || || #{amount} || #{balance}")
  end
end
