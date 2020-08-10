require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'

Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'


class CashRegisterTest < Minitest::Test

  def setup
    @transaction = Transaction.new(7)
    @transaction.amount_paid = 10
    @register = CashRegister.new(100)
  end

  def test_accept_money
    @register.accept_money(@transaction)
    assert_equal(110, @register.total_money)
  end

  def test_change
    assert_equal(3, @register.change(@transaction))
  end

  def test_give_receipt
    receipt_string = "You've paid $7.\n"
    assert_output(receipt_string) { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new("15\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(15, @transaction.amount_paid)
  end
end
