require 'pry'

class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = Array.new(n) {[]}

    calculate_rows
  end

  private

  def calculate_rows
    @rows[0] << 1

    rows.each_index do |row_idx|
      next if row_idx == 0

      previous_row = [0] + rows[row_idx - 1] + [0]
      previous_row.each_cons(2) { |pair| @rows[row_idx] << pair.reduce(&:+) }
    end
  end
end

# p Triangle.new(5).rows
