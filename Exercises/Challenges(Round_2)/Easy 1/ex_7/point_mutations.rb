class DNA
  def initialize(string)
    @string_a = string
  end

  def hamming_distance(string_b)
    length = min_length(string_b)
    (0...length).count { |idx| @string_a[idx] != string_b[idx] }
  end

  private

  def min_length(string_b)
    @string_a.length < string_b.length ? @string_a.length : string_b.length
  end
end

# puts DNA.new('').hamming_distance('')
# puts DNA.new('GGACTGA').hamming_distance('GGACTGA')
# puts DNA.new('ACT').hamming_distance('GGA')
