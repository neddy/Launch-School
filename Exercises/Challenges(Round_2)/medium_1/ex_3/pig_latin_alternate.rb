class PigLatin
  def self.translate(string)
    string.split(" ").map do |word|
      translate_word(word)
    end.join(" ")
  end

  private

  def self.translate_word(word)
    matches = word.match(/(?<vowel_word>\A[aeiou].+$|\A[xy][^aeiou].+$)|
                          (?<consonant_snd>\A.?qu|\A[xy](?![^aeiou])|\A[^aeiou]+)
                          (?<remainder>.+$)/xi)
    "#{matches[:vowel_word]}#{matches[:remainder]}#{matches[:consonant_snd]}ay"
  end
end


# puts PigLatin.translate('apple')
# puts PigLatin.translate('pig')
# puts PigLatin.translate('chair')
# puts PigLatin.translate('school')
# puts PigLatin.translate('queen')
# puts PigLatin.translate('square')
