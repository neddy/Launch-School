class DNA
  def initialize(sequence1)
    @sequence1 = sequence1
  end

  def hamming_distance(sequence2)
    differences = 0
    @sequence1.chars.each_with_index do |char, idx|
      break unless sequence2[idx]
      differences += 1 unless char == sequence2[idx]
    end
    differences
  end
end

# test = DNA.new("GAGCCTACTAACGGGAT")
# puts test.hamming_distance("CATCGTAATGACGGCCT")
