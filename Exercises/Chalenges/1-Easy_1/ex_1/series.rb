class Series
  def initialize(num_string)
    @num_array = num_string.split('').map(&:to_i)
  end

  def slices(n)
    check_length(n)
    @num_array.each_cons(n).to_a
  end

  def check_length(n)
    if n > @num_array.size
      raise ArgumentError, \
      "Requested slices of length: #{n}, Only #{@num_array.size} elements in collection"
    end
  end
end


# series = Series.new('0123456789')
# p series.slices(11)
