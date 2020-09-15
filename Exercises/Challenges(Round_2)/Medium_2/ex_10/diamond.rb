class Diamond
  LETTERS = ('A'..'Z').to_a.freeze

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    width = LETTERS.index(letter) * 2 + 1
    diamond_array = [LETTERS[0].center(width)]
    gap = 1
    LETTERS[1..-1].each do |current_letter|
      diamond_array << "#{current_letter}#{' ' * gap}#{current_letter}".center(width)
      break if current_letter == letter
      gap += 2
    end
    diamond_array = diamond_array + diamond_array[0..-2].reverse
    diamond_array.join("\n") + "\n"
  end
end

# Diamond.make_diamond('E')
