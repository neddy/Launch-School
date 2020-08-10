class Series
  def initialize(num_string)
    @numbers = num_string.split('').map(&:to_i)
  end
  def slices(n)
    raise ArgumentError if n > @numbers.size
    @numbers.each_cons(n).to_a
  end
end

# series = Series.new('01234')
# p series.slices(2)
