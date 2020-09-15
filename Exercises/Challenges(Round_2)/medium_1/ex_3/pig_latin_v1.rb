SPECIAL_START_LETTERS = %w(a e i o u xr yt)
CONSTANT_SOUNDS_3_LETTER = %w(sch squ thr)
CONSTANT_SOUNDS_2_LETTER = %w(ch gh gu ph qu sc sh th wh)

class PigLatin
  def self.translate(string)
    words = string.split(" ")
    words.map do |word|
      translate_word(word)
    end.join(" ")
  end

  private

  def self.translate_word(word)
    if start_special_letters?(word)
      word + "ay"
    elsif start_constant_sound_3_letter?(word)
      word[3..-1] + word[0..2] + "ay"
    elsif start_constant_sound_2_letter?(word)
      word[2..-1] + word[0..1] + "ay"
    else
      word[1..-1] + word[0] + "ay"
    end
  end

  def self.start_special_letters?(word)
    SPECIAL_START_LETTERS.any? { |letters| starts_with?(word, letters) }
  end

  def self.start_constant_sound_3_letter?(word)
    CONSTANT_SOUNDS_3_LETTER.any? { |letters| starts_with?(word, letters) }
  end

  def self.start_constant_sound_2_letter?(word)
    CONSTANT_SOUNDS_2_LETTER.any? { |letters| starts_with?(word, letters) }
  end

  def self.starts_with?(word, letters)
    !!Regexp.new("\\A#{letters}", Regexp::IGNORECASE).match(word)
  end
end


# puts PigLatin.translate('apple')
# puts PigLatin.translate('pig')
# puts PigLatin.translate('chair')
# puts PigLatin.translate('school')
