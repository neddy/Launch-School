class PigLatin
  def self.translate(string)
    string.split(" ").map do |word|
      translate_word(word)
    end.join(" ")
  end

  private

  def self.translate_word(word)
    if /^[aeiou]|^[xy][^aeiou]/i.match(word)
      word + "ay"
    else
      word.gsub(/^(.?qu|[^aeiou]+)([aeiou]+.*)/i, '\2\1ay')
    end
  end
end


# puts PigLatin.translate('apple')
# puts PigLatin.translate('pig')
# puts PigLatin.translate('chair')
# puts PigLatin.translate('school')
# puts PigLatin.translate('queen')
# puts PigLatin.translate('square')
