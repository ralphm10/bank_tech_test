describe TransactionLog do
  describe 'record_deposit' do
    it 'adds the details to the transactions array' do
      allow(subject).to receive(:format_date) { '12/01/2010' }
      expect(subject.record_deposit(1000, 1000)).to eq([ '12/01/2010 || 1000 || || 1000'])
    end
  end
  describe 'record_withdrawal' do
    it 'adds the details to the transactions array' do
      allow(subject).to receive(:format_date) { '12/01/2010' }
      expect(subject.record_withdrawal(1000, 500)).to eq(['12/01/2010 || || 1000 || 500'])
    end
  end
end
