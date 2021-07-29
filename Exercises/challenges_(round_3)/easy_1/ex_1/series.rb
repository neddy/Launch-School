class Series

  def initialize(number_string)
    @numbers = number_string.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @numbers.length

    start_pos = 0
    slices_arr = []
    while start_pos + n <= @numbers.length do
      slices_arr << @numbers[start_pos...(start_pos + n)]
      start_pos += 1
    end
    slices_arr
  end

end

# series = Series.new('01234')
# p series.slices(5)
