require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TestCashRegister < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(100.00)
    @transaction1 = Transaction.new(27.5)
  end

  def test_accept_money_stdin
    amount_to_pay = "27.5"
    new_total = @cash_register.total_money + amount_to_pay.to_f

    string_io = StringIO.new
    string_io.puts amount_to_pay
    string_io.rewind
    $stdin = string_io

    @transaction1.prompt_for_payment
    $stdin = STDIN

    @cash_register.accept_money(@transaction1)

    assert_equal new_total, @cash_register.total_money
  end

  def test_accept_money
    amount_to_pay = 27.5
    new_total = @cash_register.total_money + amount_to_pay

    @transaction1.amount_paid = amount_to_pay

    @cash_register.accept_money(@transaction1)

    assert_equal new_total, @cash_register.total_money
  end
end
