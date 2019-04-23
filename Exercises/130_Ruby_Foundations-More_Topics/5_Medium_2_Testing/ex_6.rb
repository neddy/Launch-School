require 'minitest/autorun'
require "minitest/reporters"
require 'stringio'

Minitest::Reporters.use!

require_relative 'cash_register.rb'
# require_relative 'transaction.rb'

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

class TestCashRegister < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(100.0)
    @transaction1 = Transaction.new(27.5)
  end

  def test_prompt_for_payment
    amount_to_pay = "27.5"
    input = StringIO.new("#{amount_to_pay}\n")

    @transaction1.prompt_for_payment(input: input)
    assert_equal amount_to_pay.to_f, @transaction1.amount_paid
  end
end
