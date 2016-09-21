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

  def balance balance_date
    @balance = @account.select { |date, value| date <= balance_date }.values.reduce(&:+)
  end

  def account_statement statement_date
    statement = @account.select { |date, value| date <= statement_date }
    statement.each do |date, value|
      if value < 0
        puts "#{date}|| ||#{-value} || #{balance(date)}"
      else
        puts "#{date} || #{value} || || #{balance(date)}"
      end
    end
  end

end
