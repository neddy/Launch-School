require 'pry'

class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = [[1]]

    (n - 1).times { add_row }
  end

  private

  def add_row
    pairs_last_row = rows.last.each_cons(2) || []
    @rows << [1] + pairs_last_row.map(&:sum) + [1]
  end
end

# p Triangle.new(3)
