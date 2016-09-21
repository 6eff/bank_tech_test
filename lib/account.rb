require './lib/deposit'
require './lib/withdrawal'

class Account

  attr_reader :account

  def initialize(balance = 0)
    @account = {}
    @balance = balance
  end

  def account_transactions(transaction)
    @account.merge! transaction
  end

  def balance
    @balance = @account.values.reduce(:+)
  end

end
