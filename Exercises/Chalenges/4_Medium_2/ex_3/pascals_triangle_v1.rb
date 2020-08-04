require 'pry'

class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = Array.new(n) { |idx| [1] * (idx + 1) }
    calculate_rows
  end

  def calculate_rows
    rows.each_with_index do |row, row_idx|
      next if row_idx == 0
      row.each_index do |idx|
        value_one = rows[row_idx - 1].fetch(idx, 0)
        value_two = idx == 0 ? 0 : rows[row_idx - 1].fetch(idx - 1)
        rows[row_idx][idx] = value_one + value_two
      end
    end
  end
end

# p Triangle.new(20).rows
