VALID_OPERATORS = %w(plus minus divided_by multiplied_by)

class WordProblem
  def initialize(problem)
    @problem_string = problem
  end

  def answer
    parse_problem
    raise ArgumentError, "Invalid problem!" unless valid_problem?
    clean_valid_problem
    @result = @problem_array.shift
    loop do
      part = @problem_array.shift
      break if part.nil?
      raise ArgumentError, "Invalid operator!" unless VALID_OPERATORS.include?(part)
      send(part)
    end
    @result
  end

  def parse_problem
    @problem_array = @problem_string.scan(/-?\d+|[a-z\s]+|\?$/i)
    @problem_array.map!(&:strip)
    @problem_array.map! { |el| el.sub(/\s/, '_') }
    @problem_array.map! { |el| el.match(/\d+/) ? el.to_i : el }
  end

  def valid_problem?
    @problem_array[0] == "What_is" &&
    @problem_array[1].kind_of?(Numeric) &&
    @problem_array[-1] == "?"
  end

  def clean_valid_problem
    @problem_array.delete_at(0)
    @problem_array.delete_at(-1)
  end

  private

  def plus
    @result += @problem_array.shift
  end

  def minus
    @result -= @problem_array.shift
  end

  def multiplied_by
    @result *= @problem_array.shift
  end

  def divided_by
    @result /= @problem_array.shift
  end

  # def cubed
  #   @result = @result**2
  # end
end
