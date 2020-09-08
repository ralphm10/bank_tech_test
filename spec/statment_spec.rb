describe Statement do
  let(:fake_account) { double :account }
  describe '.print_statement' do
    it 'displays transaction details and date for a deposit' do
      allow(fake_account).to receive(:transactions) { ['10/01/2012 || 1000.00 || || 1000.00'] }
      expect(subject.print_statement(fake_account)).to eq(['10/01/2012 || 1000.00 || || 1000.00'])
    end
    it 'displays transaction details and date for a deposit and withdrawal' do
      allow(fake_account).to receive(:transactions) { ['10/01/2012 || 1000.00 || || 1000.00', '15/01/2012 || || 500.00 || 500.00'] }
      expect(subject.print_statement(fake_account))
        .to eq(["15/01/2012 || || 500.00 || 500.00", "10/01/2012 || 1000.00 || || 1000.00"])
    end
  end
end
