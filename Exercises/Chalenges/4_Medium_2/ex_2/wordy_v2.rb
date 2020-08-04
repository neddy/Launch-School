require 'pry'

class WordProblem
  OPERATIONS = {
    "plus" => :+,
    "minus" => :-,
    "divided" => :/,
    "multiplied" => :*
  }

  def initialize(problem_string)
    parse_problem(problem_string.downcase)

    unless numbers.size > 1 && operators.size > 0
      raise ArgumentError, 'Problem could not be parsed'
    end
  end

  def answer
    operators.each do |operation|
      answer = numbers.slice!(0,2).reduce(&OPERATIONS[operation])
      @numbers.prepend(answer)
    end
    numbers[0]
  end

  private

  attr_reader :numbers, :operators

  def parse_problem(problem_string)
    @operators = problem_string.split(' ').select do |word|
      OPERATIONS.keys.include?(word)
    end

    @numbers = problem_string.scan(/-?\d+/).map(&:to_i)
  end
end

# test = WordProblem.new('What-the is -80 Multiplied 2?')
# puts test.answer
