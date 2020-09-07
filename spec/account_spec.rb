require 'account'

describe Account do
  describe '.display_balance' do
    it 'displays a balance of 0 on initialization' do
      expect(subject.display_balance).to eq('0.00')
    end
  end
  describe '.deposit' do
    it 'changes the balance by the amount deposited' do
      subject.deposit(1000)
      expect(subject.display_balance).to eq('1000.00')
    end
    it 'changes can handle decimal deposits' do
      subject.deposit(1000.50)
      expect(subject.display_balance).to eq('1000.50')
    end
  end
  describe '.withdraw' do
    it 'changes the balance by the amount withdrawn' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.display_balance).to eq('500.00')
    end
    it 'changes can handle decimal deposits' do
      subject.deposit(1000.50)
      subject.withdraw(500)
      expect(subject.display_balance).to eq('500.50')
    end
  end
end
