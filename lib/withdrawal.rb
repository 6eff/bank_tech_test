class Withdrawal

  attr_reader :withdrawals

  def initialize(account)
    @account = account
    @withdrawals = {}
  end

  def withdraw_from_account(amount, date = Time.now.strftime('%d/%m/%Y'))
    @withdrawals.store(date,-amount)
  end

end
