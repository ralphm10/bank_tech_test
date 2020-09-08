class TransactionLog
  def initialize
    @transactions = []
  end

  def record_deposit(amount, date, balance)
    @transactions.push("#{date} || #{amount} || || #{balance}")
  end

  def record_withdrawal(amount, date, balance)
    @transactions.push("#{date} || || #{amount} || #{balance}")
  end
end
