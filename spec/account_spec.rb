require 'account'

describe Account do
  describe '.display_balance' do
    it 'displays a balance of 0 on initialization' do
      expect(subject.format_amount(subject.balance)).to eq('0.00')
    end
  end
  describe '.deposit' do
    it 'changes the balance by the amount deposited' do
      subject.deposit(1000, '10/01/2012')
      expect(subject.format_amount(subject.balance)).to eq('1000.00')
    end
    it 'can handle decimal deposits' do
      subject.deposit(1000.50, '10/01/2012')
      expect(subject.format_amount(subject.balance)).to eq('1000.50')
    end
    it 'raises an error for an negative amount' do
      expect { subject.deposit(-200, '10/01/2012') }.to raise_error(RuntimeError)
    end
    it 'raises an error for an incorrect input' do
      expect { subject.deposit('Football', '10/01/2012') }.to raise_error(ArgumentError)
    end
  end
  describe '.withdraw' do
    it 'changes the balance by the amount withdrawn' do
      subject.deposit(1000, '10/01/2012')
      subject.withdraw(500, '11/01/2012')
      expect(subject.format_amount(subject.balance)).to eq('500.00')
    end
    it 'can handle decimal deposits' do
      subject.deposit(1000, '10/01/2012')
      subject.withdraw(500.50, '11/01/2012')
      expect(subject.format_amount(subject.balance)).to eq('499.50')
    end
    it 'raises an error for an negative amount' do
      expect { subject.withdraw(-200, '10/01/2012') }.to raise_error(RuntimeError)
    end
    it 'raises an error for an incorrect input' do
      expect { subject.withdraw('Football', '10/01/2012') }.to raise_error(ArgumentError)
    end
  end
end
