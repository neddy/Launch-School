class InvalidCodonError < StandardError; end

CODONS_TABLE = {
  ['AUG'] => 'Methionine',
  ['UUU', 'UUC'] => 'Phenylalanine',
  ['UUA', 'UUG'] => 'Leucine',
  ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
  ['UAU', 'UAC'] => 'Tyrosine',
  ['UGU', 'UGC'] =>	'Cysteine',
  ['UGG'] => 'Tryptophan',
  ['UAA', 'UAG', 'UGA'] =>	'STOP'
  }

class Translation
  def self.of_codon(codon)
    CODONS_TABLE.each do |codons, polypeptide|
      return polypeptide if codons.include?(codon)
    end
    raise InvalidCodonError
  end

  def self.of_rna(rna_string)
    codons = rna_string.scan(/.{1,3}/)
    polypeptides = []
    codons.each do |codon|
      polypeptide = of_codon(codon)
      break if polypeptide == 'STOP'
      polypeptides << polypeptide
    end
    polypeptides
  end
end

# p Translation.of_codon('AUG')
