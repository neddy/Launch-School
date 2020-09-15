

class BeerSong
  def initialize
    @lyrics_array = []
    build_lyrics
  end

  def verse(n)
    @lyrics_array[n]
  end

  def verses(finish,  start)
    @lyrics_array[start..finish].reverse.join("\n")
  end

  def lyrics
    @lyrics_array.reverse.join("\n")
  end

  private

  def build_lyrics
    @lyrics_array << verse_0
    @lyrics_array << verse_1
    @lyrics_array << verse_2
    (3..99).each { |n| @lyrics_array << verse_generic(n) }
  end

  def verse_2
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse_1
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse_0
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse_generic(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
    "Take one down and pass it around, #{n -1} bottles of beer on the wall.\n"
  end
end

# puts BeerSong.new.verse(2)
# puts BeerSong.new.verses(99, 98)
# puts BeerSong.new.lyrics
