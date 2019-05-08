# Initial answer
# class BeerSong
#   def verse(verse)
#     verses(verse, verse)
#   end
#
#   def verses(first_verse, last_verse)
#     (last_verse..first_verse).reverse_each.map do |verse_number|
#       case verse_number
#       when 3..99
#         "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" +
#         "Take one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n"
#       when 2
#         "2 bottles of beer on the wall, 2 bottles of beer.\n" +
#         "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#       when 1
#         "1 bottle of beer on the wall, 1 bottle of beer.\n" +
#         "Take it down and pass it around, no more bottles of beer on the wall.\n"
#       when 0
#         "No more bottles of beer on the wall, no more bottles of beer.\n" +
#         "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#       end
#     end.join("\n")
#   end
#
#   def lyrics
#     verses(99, 0)
#   end
# end
#
# # puts BeerSong.new.verses(2, 0)
# # puts BeerSong.new.verse(5)
# # puts BeerSong.new.lyrics

#Bonus Points Answer
module BeerSongVerses
  class ManyBottles
    def self.verse_lyrics(n)
      "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" +
      "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
    end
  end

  class TwoBottles
    def self.verse_lyrics(_)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" +
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class OneBottle
    def self.verse_lyrics(_)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class ZeroBottles
    def self.verse_lyrics(_)
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end

class BeerSong
  WHICH_VERSE = Hash.new(:ManyBottles).update(
    0 => :ZeroBottles,
    1 => :OneBottle,
    2 => :TwoBottles
  )

  def verse(verse)
    verses(verse, verse)
  end

  def verses(first_verse, last_verse)
    (last_verse..first_verse).reverse_each.map do |verse_number|
      verse_class = BeerSongVerses.const_get(WHICH_VERSE[verse_number])
      verse_class.verse_lyrics(verse_number)
    end.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

# puts BeerSong.new.verses(2, 0)
# puts BeerSong.new.verse(5)
# puts BeerSong.new.lyrics
