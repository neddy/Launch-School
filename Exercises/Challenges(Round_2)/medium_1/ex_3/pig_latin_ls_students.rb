# class PigLatin
#   PIG = 'ay'.freeze
#
#   def self.translate(words)
#     words.split.map do |word|
#       idx = word =~ /[aeio]|(?<!q)u|[xy][^aeiou]/
#       word[idx..-1] + word[0...idx] + PIG
#     end.join(' ')
#   end
# end

class PigLatin
  def self.translate(str)
    str.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    cut_index = word =~ /[aeio]|(?<!q)u|[xy][^aeiou]/
    word[cut_index..-1] + word[0...cut_index] + 'ay'
  end
end


# puts PigLatin.translate('apple')
# puts PigLatin.translate('pig')
# puts PigLatin.translate('chair')
# puts PigLatin.translate('school')
# puts PigLatin.translate('queen')
# puts PigLatin.translate('square')
