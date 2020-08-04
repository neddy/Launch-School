require 'pry'
class WordProblem
  OPERATORS = %w(plus minus divided multiplied)
  def initialize(problem_string)
    @problem_string = problem_string
    parse_numbers
    parse_operators

    unless numbers.size > 1 && operators.size > 0
      raise ArgumentError, 'Problem could not be parsed'
    end
  end

  def answer
    operators.each { |operation| send(operation) }
    numbers.first
  end

  private

  attr_reader :problem_string, :numbers, :operators

  def parse_operators
    @operators = problem_string.split(' ').select do |word|
      OPERATORS.include?(word)
    end
  end

  def parse_numbers
    numbers = problem_string.gsub(/[^0-9\-\s]/, '')
    @numbers = numbers.split(' ').select do |word|
      word == word.to_i.to_s
    end.map(&:to_i)
  end

  def plus
    answer = numbers.slice!(0,2).reduce(&:+)
    @numbers.prepend(answer)
  end

  def minus
    answer = numbers.slice!(0,2).reduce(&:-)
    @numbers.prepend(answer)
  end

  def divided
    answer = numbers.slice!(0,2).reduce(&:/)
    @numbers.prepend(answer)
  end

  def multiplied
    answer = numbers.slice!(0,2).reduce(&:*)
    @numbers.prepend(answer)
  end
end

# test = WordProblem.new('What-the is -8 divided 2?')
# puts test.answer
