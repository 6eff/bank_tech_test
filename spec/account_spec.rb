require_relative '../lib/account.rb'
require_relative '../lib/deposit.rb'
require_relative '../lib/withdrawal.rb'

describe Account do
  subject(:account) { described_class.new }
  let(:deposit) { Deposit.new(account) }
  let(:withdrawal) { Withdrawal.new(account) }

  it 'calculates account balance' do
    deposit.place_deposit(500, "12/09/2016")
    withdrawal.withdraw_from_account(400, "13/09/2016")
    account.account_transactions deposit.deposits
    account.account_transactions withdrawal.withdrawals
    expect(account.balance).to eq 100
  end

end
