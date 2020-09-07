require 'account'

describe Account do
  describe '.display_balance' do
    it 'displays a balance of 0 on initialization' do
      expect(subject.display_balance).to eq('0.00')
    end
  end
  describe '.deposit' do
    it 'changes the balance by the amount deposited' do
      subject.deposit(1000, '10/01/2012')
      expect(subject.display_balance).to eq('1000.00')
    end
    it 'changes can handle decimal deposits' do
      subject.deposit(1000.50, '10/01/2012')
      expect(subject.display_balance).to eq('1000.50')
    end
  end
  describe '.withdraw' do
    it 'changes the balance by the amount withdrawn' do
      subject.deposit(1000, '10/01/2012')
      subject.withdraw(500, '11/01/2012')
      expect(subject.display_balance).to eq('500.00')
    end
    it 'changes can handle decimal deposits' do
      subject.deposit(1000.50, '10/01/2012')
      subject.withdraw(500, '11/01/2012')
      expect(subject.display_balance).to eq('500.50')
    end
  end
  describe '.display_transactions' do
    it 'displays transaction details and date for a deposit' do
      subject.deposit(1000, '10/01/2012')
      expect(subject.display_transactions).to eq("10/01/2012 || 1000.00 || || 1000.00\n")
    end
    it 'displays transaction details and date for a deposit and withdrawal' do
      subject.deposit(1000, '10/01/2012')
      subject.withdraw(500, '15/01/2012')
      expect(subject.display_transactions).to eq("10/01/2012 || 1000.00 || || 1000.00\n15/01/2012 || || 500.00 || 500.00\n")
    end
  end
end
