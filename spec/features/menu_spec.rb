require_relative '../../lib/menu.rb'

describe Menu do

  subject(:menu) { described_class.new }

  it 'should display Deposit, Withdrawal, Account statement' do
    expect(menu.print_menu).to eq described_class::MENU
  end

  it 'should accept user selection and display relevant submenu ' do
    action = 1
    expect{menu.select_action(action)}.to output("Please enter amount to be deposited\n").to_stdout
  end

end
