class InvalidCodonError < StandardError; end

# CONDON_ARRAY = [
#   [%w(AUG), "Methionine"],
#   [%w(UUU UUC), "Phenylalanine"],
#   [%w(UUA UUG), "Leucine"],
#   [%w(UCU UCC UCA UCG), "Serine"],
#   [%w(UAU UAC), "Tyrosine"],
#   [%w(UGU UGC), "Cysteine"],
#   [%w(UGG), "Tryptophan"],
#   [%w(UAA UAG UGA), "STOP"]
# ]
#
# condon_table = {}
# CONDON_ARRAY.each do |condons, a_acid|
#   condons.each { |condon| condon_table[condon] = a_acid }
# end
#
# p condon_table

CONDON_TABLE = {
  "AUG"=>"Methionine", "UUU"=>"Phenylalanine", "UUC"=>"Phenylalanine",
  "UUA"=>"Leucine", "UUG"=>"Leucine", "UCU"=>"Serine", "UCC"=>"Serine",
  "UCA"=>"Serine", "UCG"=>"Serine", "UAU"=>"Tyrosine", "UAC"=>"Tyrosine",
  "UGU"=>"Cysteine", "UGC"=>"Cysteine", "UGG"=>"Tryptophan", "UAA"=>"STOP",
  "UAG"=>"STOP", "UGA"=>"STOP"
}

# STOP = %w(UAA, UAG, UGA)

class Translation
  def self.of_rna(strand)
    translation = []
    strand.scan(/.{1,3}/).each do |condon|
      protien = of_codon(condon)
      break if protien == "STOP"
      translation << protien
    end
    translation
  end

  def self.of_codon(condon)
    raise InvalidCodonError unless valid_condon?(condon)
    CONDON_TABLE[condon]
  end

  private

  def self.valid_condon?(condon)
    CONDON_TABLE.keys.include?(condon)
  end
end

# p Translation.of_codon("UUU")
