require_relative '../../lib/menu.rb'
require 'rspec/mocks/standalone'

describe Menu do

  subject(:menu) { described_class.new }

  it 'should display Deposit, Withdrawal, Account statement' do
    expect(menu).to receive(:select_action)
    expect{menu.print_menu}.to output("Please enter option number and hit enter\n1 Deposit\n2 Withdrawal\n3 Account statement\n4 Exit\n").to_stdout
  end

  it 'should accept user selection and display relevant submenu ' do
    action = 1
    allow(menu).to receive(:print_menu)
    expect{menu.select_action(action)}.to output("Please enter amount to be deposited and hit enter\n").to_stdout
  end

end
