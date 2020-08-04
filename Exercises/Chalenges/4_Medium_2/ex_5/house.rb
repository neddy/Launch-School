require 'pry'

class House

  def self.recite
    new.recite
  end

  def recite
    (1..pieces.size).map { |n| verse(n) }.join("\n")
  end

  private

  def verse(n)
    segments = ['This is'] + pieces[-n..-1].flatten
    segments.each_slice(2).map {|pair| pair.join(' ') }.join("\n") + ".\n"
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

# puts House.new.recite
