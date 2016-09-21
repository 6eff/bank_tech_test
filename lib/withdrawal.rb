class Withdrawal

  attr_reader :withdrawals

  def initialize(account)
    @account = account
    @withdrawals = {}
  end

  def withdraw_from_account(amount, date = Time.now)
    @withdrawals.store(date,-amount)
  end

end
