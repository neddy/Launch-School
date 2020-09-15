require 'pry'
class Triangle
  def initialize(rows)
    @triangle = []
    @rows = rows
    generate_triangle
    nil
  end

  def rows
    @triangle.clone
  end

  private

  def generate_triangle
    return if @rows <= 0
    @triangle << [1]
    (2..@rows).each do |row|
      new_row = [1]
      (1...row).each do |idx|
        new_row << @triangle.last[idx - 1].to_i + @triangle.last[idx].to_i
      end
      @triangle << new_row
    end
  end
end


# p Triangle.new(5).rows


# 1
# 1 1
# 1 2 1
# 1 3 3 1
# 1 4 6 4 1
