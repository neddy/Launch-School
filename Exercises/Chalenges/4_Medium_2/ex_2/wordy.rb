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

    unless numbers.size > 1 && operations.size > 0
      raise ArgumentError, 'Problem could not be parsed'
    end
  end

  def answer
    @operations = operations.to_enum

    numbers.reduce do |result, number|
      result.send(OPERATIONS[operations.next], number)
    end
  end

  private

  attr_reader :numbers, :operations

  def parse_problem(problem_string)
    @operations = problem_string.split(' ').select do |word|
      OPERATIONS.keys.include?(word)
    end

    @numbers = problem_string.scan(/-?\d+/).map(&:to_i)
  end
end

# test = WordProblem.new('What-the is 5 plus 5 Multiplied 2?')
# puts test.answer
