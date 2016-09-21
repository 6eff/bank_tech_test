require_relative '../lib/deposit.rb'

describe Deposit do
  subject(:deposit) { described_class.new(account) }
  let(:account) { instance_double "Account" }

  it 'stores client deposit transactions with dates' do
    deposit.place_deposit(500, "12/09/2016")
    deposit.place_deposit(500, "13/09/2016")
    expect(deposit.deposits["13/09/2016"]).to eq 500 
  end

end
