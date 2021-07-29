require 'pry'

class Triangle
  def initialize(*sides)
    raise ArgumentError unless check(sides)
    @sides = sides
  end

  def kind
    if @sides.all? { |side| side == @sides[0] }
      "equilateral"
    elsif @sides.combination(2).any? { |side_a, side_b| side_a == side_b }
      "isosceles"
    else
      "scalene"
    end
  end

  private

  def check(sides)
    if sides.size != 3
      false
    elsif sides.any? { |side| side <= 0 }
      false
    elsif sides.permutation.any? { |a, b, c| (a + b) <= c }
      false
    else
      true
    end
  end
end


# Triangle.new(10, 10, 10)
