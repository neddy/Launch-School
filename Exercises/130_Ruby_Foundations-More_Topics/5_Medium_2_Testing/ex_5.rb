require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TestCashRegister < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(100.0)
    @transaction1 = Transaction.new(27.5)
  end

  def test_give_receipt
    assert_output(stdout = "You've paid $27.5.\n") { @cash_register.give_receipt(@transaction1) }
  end
end
