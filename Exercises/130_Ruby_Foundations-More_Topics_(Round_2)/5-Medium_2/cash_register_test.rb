require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction.rb'

require 'pry'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(10)
  end

  # Q3
  def test_accept_money

    @transaction.amount_paid = 10
    @cash_register.accept_money(@transaction)
    assert_equal(1010, @cash_register.total_money)
  end

  # Q4
  def test_change
    @transaction.amount_paid = 50
    assert_equal(40, @cash_register.change(@transaction))
  end

  #Q5
  def test_give_receipt
    assert_output("You've paid $10.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end

  # Q6
  # def test_prompt_for_payment
  #   @transaction.prompt_for_payment(input: StringIO.new('20'))
  #   assert_equal(20, @transaction.amount_paid)
  # end

  # Q7
  def test_prompt_for_payment_no_output
    stdout_orig = $stdout
    stdout_mock = StringIO.new
    $stdout = stdout_mock

    @transaction.prompt_for_payment(input: StringIO.new('20'))

    assert_equal(20, @transaction.amount_paid)
  ensure
    $stdout = stdout_orig
  end

  # Q7 LS Answer
  # #Modified Transaction::prompt_for_payment method
  # def prompt_for_payment(input: $stdin, output: $stdout)
  #   loop do
  #     output.puts "You owe $#{item_cost}.\nHow much are you paying?"
  #     @amount_paid = input.gets.chomp.to_f
  #     break if valid_payment? && sufficient_payment?
  #     output.puts 'That is not the correct amount. ' \
  #          'Please make sure to pay the full cost.'
  #   end
  # end
  #
  # # Test
  # def test_prompt_for_payment
  #   transaction = Transaction.new(30)
  #   input = StringIO.new('30')
  #   output = StringIO.new
  #   transaction.prompt_for_payment(input: input, output: output)
  #   assert_equal 30, transaction.amount_paid
  # end
end
