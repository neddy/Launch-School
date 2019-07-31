require 'pry'
class InvalidCodonError < StandardError; end

CONDONS_TABLE = {
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
    polypeptide = codons_hash[codon]
    if polypeptide
      polypeptide
    else
      raise InvalidCodonError
    end
  end

  def self.of_rna(rna_string)
    rna = rna_string.scan(/.{1,3}/)
    polypeptides = []
    rna.each do |codon|
      polypeptide = of_codon(codon)
      break if polypeptide == 'STOP'
      polypeptides << polypeptide
    end
    polypeptides
  end

  def self.codons_hash
    hash = {}
    CONDONS_TABLE.each do |codes, polypeptides|
      codes.each { |code| hash[code] = polypeptides }
    end
    hash
  end
end

p Translation.of_codon('AUG')
