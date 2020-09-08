require 'statement'

describe Statement do
  let(:fake_transactions) { double :transaction_log }
  let(:expected_output) do
    "date || credit || debit || balance\n15/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00\n"
  end
  describe '.print_statement' do
    it 'displays transaction details and date for a deposit and withdrawal' do
      allow(fake_transactions).to receive(:transactions) {
        ['10/01/2012 || 1000.00 || || 1000.00', '15/01/2012 || || 500.00 || 500.00']
      }
      expect { subject.print_statement(fake_transactions) }.to output(expected_output).to_stdout
    end
  end
end
