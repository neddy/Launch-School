class Anagram
  def initialize(word)
    @word = word
    @letters = letters(word)
  end

  def match(possible_matches)
    possible_matches.select { |possible_match| is_anagram?(possible_match) }
  end

  private

  def is_anagram?(possible_match)
    @word.downcase != possible_match.downcase &&
    @letters == letters(possible_match)
  end

  def letters(word)
    word.downcase.chars.sort
  end
end
