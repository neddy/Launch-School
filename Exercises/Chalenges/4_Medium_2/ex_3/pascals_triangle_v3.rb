require 'pry'

class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = [[1]]
    @row_count = n

    calculate_rows unless row_count <= 1
  end

  private

  attr_reader :row_count

  def calculate_rows
    @rows << [1, 1]
    (row_count - 2).times do
      add_row
    end
  end

  def add_row
    @rows << [1] + rows.last.each_cons(2).map(&:sum) + [1]
  end
end

# p Triangle.new(5).rows
