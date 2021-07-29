class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    comparison_length = [@strand.length, other_strand.length].min
    diff = 0
    comparison_length.times do |idx|
      diff += 1 unless @strand[idx] == other_strand[idx]
    end
    diff
  end
end
