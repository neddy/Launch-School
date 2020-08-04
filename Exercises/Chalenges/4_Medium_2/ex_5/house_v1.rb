require 'pry'

class House

  def self.recite
    new.recite
  end

  def recite
    previous_paragraphs = []
    previous_string = ''
    pieces.reverse.map do |strings|
      new_sentences = ["This is " + strings[0]]
      new_sentences << strings[1] + " " + previous_string if strings[1]
      new_sentences << previous_paragraphs.join("\n") unless previous_paragraphs.empty?
      new_paragraph = new_sentences.join("\n")

      previous_paragraphs.prepend(new_sentences[1]) if new_sentences[1]
      previous_string = strings[0]

      new_paragraph
    end.join(".\n\n") + ".\n"
  end

  private

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
