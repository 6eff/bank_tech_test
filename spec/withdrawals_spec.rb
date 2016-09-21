require_relative '../lib/withdrawal.rb'

describe Withdrawal do
  subject(:withdrawal) { described_class.new(account) }
  let(:account) { instance_double "Account" }

  it 'stores client withdrawal transactions with dates' do
    withdrawal.withdraw_from_account(400, "13/09/2016")
    expect(withdrawal.withdrawals["13/09/2016"]).to eq -400
  end

end
