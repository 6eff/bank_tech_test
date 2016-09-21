class Menu
  MENU = ['Deposit', 'Withdrawal', 'Account statement']

  def print_menu
    n = 0
    puts "Please enter option number and hit enter"
    MENU.each {|item| puts "#{n += 1} #{item}"}
  end

  def select_action(action = STDIN.gets.to_i)
    if action == 1
      puts "Please enter amount to be deposited"
    elsif action == 2
      puts "Please enter amount to be withdrawn"
    elsif action == 3
      puts "Here is your account statement"
    else
      print_menu
    end
  end
end
