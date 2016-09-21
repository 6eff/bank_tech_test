require './lib/account'
require './lib/deposit'
require './lib/withdrawal'

class Menu
  attr_reader :account

  MENU = ['Deposit', 'Withdrawal', 'Account statement']

  def initialize
    @account = Account.new
  end

  def print_menu
    n = 0
    puts "Please enter option number and hit enter"
    MENU.each {|item| puts "#{n += 1} #{item}"}
    select_action
  end

  def select_action(action = STDIN.gets.to_i)
    if action == 1
      puts "Please enter amount to be deposited and hit enter"
      deposit = Deposit.new(@account)
      deposit.place_deposit(STDIN.gets.to_i)
      @account.account_transactions deposit.deposits
      print_menu
    elsif action == 2
      puts "Please enter amount to be withdrawn and hit enter"
      withdrawal = Withdrawal.new(@account)
      withdrawal.withdraw_from_account(STDIN.gets.to_i)
      @account.account_transactions withdrawal.withdrawals
      print_menu
    elsif action == 3
      puts "Please enter statement date in dd/mm/YYYY format and hit enter"
      statement_date = STDIN.gets.chomp
      puts "date || credit || debit || balance"
      @account.account_statement(statement_date)
      print_menu
    else
      print_menu
    end
  end
end

menu = Menu.new
menu.print_menu
