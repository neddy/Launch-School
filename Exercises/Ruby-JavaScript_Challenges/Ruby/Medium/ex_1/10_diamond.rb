# class Diamond
#   def self.make_diamond(letter)
#     letter_distance = letter.ord - 65
#     width = (letter_distance * 2) + 1
#
#     diamond_array = []
#     diamond_array << "A".center(width) + "\n"
#     middle = " "
#
#     (66..letter.ord).each do |chr_ord|
#       diamond_array << "#{chr_ord.chr}#{middle}#{chr_ord.chr}".center(width) + "\n"
#       middle = middle + "  "
#     end
#     (diamond_array + diamond_array.reverse[1..-1]).join
#   end
# end


class Diamond
  INITIAL_LETTER = "A"

  def self.make_diamond(given_letter)
    width = ((given_letter.ord - INITIAL_LETTER.ord) * 2) + 1

    half_diamond = []
    half_diamond << "#{INITIAL_LETTER}".center(width) + "\n"
    middle = " "

    ((INITIAL_LETTER.ord + 1)..given_letter.ord).each do |chr_ord|
      half_diamond << "#{chr_ord.chr}#{middle}#{chr_ord.chr}".center(width) + "\n"
      middle = middle + "  "
    end
    (half_diamond + half_diamond.reverse[1..-1]).join
  end
end


# puts Diamond.make_diamond('C')
