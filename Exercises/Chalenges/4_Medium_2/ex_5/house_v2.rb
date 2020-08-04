require 'pry'

class House

  def self.recite
    new.recite
  end

  def recite
    @previous_paragraphs = []
    @previous_string = ''

    pieces.reverse.map do |strings|
      current_paragraph(strings)
    end.join(".\n\n") + ".\n"
  end

  private

  attr_reader :previous_string

  def current_paragraph(strings)
    new_sentences = [ sentence_one(strings), sentence_two(strings), previous_paragraphs]

    @previous_paragraphs.prepend(new_sentences[1]) if strings[1]
    @previous_string = strings[0]

    new_sentences.reject(&:empty?).join("\n")
  end

  def sentence_one(strings)
    "This is #{strings[0]}"
  end

  def sentence_two(strings)
    "#{strings.fetch(1, '')} #{previous_string}".strip
  end

  def previous_paragraphs
    @previous_paragraphs.join("\n")
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

# puts House.recite
