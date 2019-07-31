# Protein Translation

The problem, convert RNA sequences into codons and then polypeptides.

The program should be able to translate individual codons, or RNA sequences using different functions.

Each codon is 3 characters long. These codons can then be translated to polypeptides using a dictionary. There are 3 codons that indicate that translation should stop, no further translation should occur after a stop codons.

Invalid condos should raise an error.

some amino acids have multiple codons that relate to it.

Codon	Amino Acids
AUG	Methionine
UUU, UUC	Phenylalanine
UUA, UUG	Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	Tyrosine
UGU, UGC	Cysteine
UGG	Tryptophan
UAA, UAG, UGA	STOP


# Data structure

RNA sequences should be stored in an array

codon / amin acid as hash


# Solution

Split RNA sequences into codons.

Then loop through each codon and translate to amino acid. If a 'stop' sequence is reached, then stop tranlating and return what has been translated so far.

Raise an error for invalid codons.
