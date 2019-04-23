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

  def test_change
    amount_to_pay = 50.0
    change_expected = 50.0 - 27.5

    @transaction1.amount_paid = amount_to_pay
    assert_equal change_expected, @cash_register.change(@transaction1)
  end
end
