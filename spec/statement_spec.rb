require 'statement'

describe Statement do
  let(:fake_date) { '12/01/2010' }
  let(:fake_deposit) { '1000.00' }
  let(:fake_balance) { '1000.00' }
  describe '.record_deposit' do
    it 'adds the details to the transactions array' do
      allow(subject).to receive(:format_date) { fake_date }
      expect(subject.record_deposit(fake_deposit, fake_balance)).to eq(['12/01/2010 || 1000.00 || || 1000.00'])
    end
  end
  let(:fake_withdrawal) { '1000.00' }
  let(:fake_balance_2) { '500.00' }
  describe '.record_withdrawal' do
    it 'adds the details to the transactions array' do
      allow(subject).to receive(:format_date) { fake_date }
      expect(subject.record_withdrawal(fake_withdrawal, fake_balance_2)).to eq(['12/01/2010 || || 1000.00 || 500.00'])
    end
  end

  let(:expected_output) do
    "date || credit || debit || balance\n15/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00\n"
  end
  let(:fake_date_2) { '10/01/2012' }
  let(:fake_date_3) { '15/01/2012' }
  let(:fake_withdrawal_2) { '500.00' }
  describe '.print_statement' do
    it 'displays transaction details and date for a deposit and withdrawal' do
      allow(subject).to receive(:format_date) { fake_date_2 }
      subject.record_deposit(fake_deposit, fake_balance)
      allow(subject).to receive(:format_date) { fake_date_3 }
      subject.record_withdrawal(fake_withdrawal_2, fake_balance_2)
      expect { subject.print_statement }.to output(expected_output).to_stdout
    end
  end
end
