require './lib/account'
require './lib/deposit'
require './lib/withdrawal'

class Menu

  MENU = ['Deposit', 'Withdrawal', 'Account statement', 'Exit']

  def initialize
    @account = Account.new
    @deposit = Deposit.new @account
    @withdrawal = Withdrawal.new @account
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
      @deposit.place_deposit(STDIN.gets.to_i)
      @account.account_transactions @deposit.deposits
      print_menu
    elsif action == 2
      puts "Please enter amount to be withdrawn and hit enter"
      @withdrawal.withdraw_from_account(STDIN.gets.to_i)
      @account.account_transactions @withdrawal.withdrawals
      print_menu
    elsif action == 3
      puts "Please enter statement date in dd/mm/YYYY format and hit enter"
      statement_date = STDIN.gets.chomp
      puts "date || credit || debit || balance"
      @account.account_statement(statement_date)
      print_menu
    elsif action == 4
      puts "Goodby!"
      return
    else
      print_menu
    end
  end
end

menu = Menu.new
menu.print_menu
