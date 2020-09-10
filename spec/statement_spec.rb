require 'statement'

describe Statement do
  let(:fake_date) { '12/01/2010' }
  describe '.record_deposit' do
    it 'adds the details to the transactions array' do
      allow(subject).to receive(:format_date) { fake_date }
      expect(subject.record_deposit(1000)).to eq(['12/01/2010 || 1000.00 || || 1000.00'])
    end
  end
  describe '.record_withdrawal' do
    it 'adds the details to the transactions array' do
      allow(subject).to receive(:format_date) { fake_date }
      subject.record_deposit(1000)
      expect(subject.record_withdrawal(500))
        .to eq(['12/01/2010 || 1000.00 || || 1000.00', '12/01/2010 || || 500.00 || 500.00'])
    end
  end
  describe '.calculate_balance' do
    it 'returns the balance for multiple transactions' do
      4.times { subject.record_deposit(250) }
      subject.record_withdrawal(500)
      expect(subject.calculate_balance).to eq(500)
    end
  end
  let(:expected_output) do
    "date || credit || debit || balance\n15/01/2012 || || 500.10 || 500.15\n10/01/2012 || 1000.25 || || 1000.25\n"
  end
  let(:fake_date_2) { '10/01/2012' }
  let(:fake_date_3) { '15/01/2012' }
  describe '.print_statement' do
    it 'displays transaction details and date for a deposit and withdrawal' do
      allow(subject).to receive(:format_date) { fake_date_2 }
      subject.record_deposit(1000.25)
      allow(subject).to receive(:format_date) { fake_date_3 }
      subject.record_withdrawal(500.10)
      expect { subject.print_statement }.to output(expected_output).to_stdout
    end
  end
end
