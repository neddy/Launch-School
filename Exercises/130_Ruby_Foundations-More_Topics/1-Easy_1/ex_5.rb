# ex_5.rb
#
# Encrypted Pioneers
# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

ALPHABET = ('a'..'z').to_a

def rotate_character(character)
  idx = ALPHABET.index(character.downcase)
  new_character = ALPHABET[idx - 13]
  character == character.upcase ? new_character.upcase : new_character
end

def rot13_converter(text)
  text.chars.map do |character|
    if character =~ /[A-Z]/i
      rotate_character(character)
    else
      character
    end
  end.join
end

names = <<~NAMES.chomp
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
NAMES

puts rot13_converter(names)
