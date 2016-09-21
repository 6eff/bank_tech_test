class Deposit

attr_reader :deposits

  def initialize(account)
    @account = account
    @deposits = {}
  end

  def place_deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @deposits.store(date, amount)
  end

end
