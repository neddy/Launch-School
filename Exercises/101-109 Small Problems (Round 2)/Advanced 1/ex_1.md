I didn't realise that you could build your own text files with placeholders, so I went about this a little differently. I first gathered a few words lists of common words for each type of word (about 2500 words all up).

Next I loaded text from a file, then split that text files into an array with sub arrays for paragraphs, sentences and words. This is done so that I can manipulate the words and then reconstruct the sentences and paragraphs with punctuation and new lines as appropriate.

This is the structure of the arrays I used below

I first broke up the text into paragraphs, splitting at each occurrence of two new line characters, the resulting array looks as follows:

`[P1, P2, P3 ... Pn]`

Next I split up each paragraph into sentences, and then words and punctuations. Each sentence consisting of a 2 element array, the first elements is an array of words, and the next element is the punctuation for that sentence.

A single paragraph would look as follows:

`[[words array, punctuation], [words array, punctuation],[words array, punctuation] ... [words array, punctuation]]`

From there, I could loop through the paragraphs, and then the sentences and finally the words to match and replace words with the same type of word, then reconstruct the original text with "nouns", "verbs", "adjectives" and "adverbs" replaced.

```ruby
FILES_PATH = "ex_1_files/"
OUTPUT_DIR = "ex_1_output/"
WORD_TYPES = ["nouns", "verbs", "adjectives", "adverbs"]

def build_word_lists()
  words_lists = {}
  WORD_TYPES.each do |type|
    words = []
    File.open("#{FILES_PATH}#{type}.txt", 'r').each do |word|
      words << word.chomp
    end
    words_lists[type] = words
  end
  words_lists
end

def split_paragraphs(text)
  paragraphs = text.split("\n\n")

  paragraphs.map! do |paragraph|
    paragraph.split(/([,.?!;])+\s|([,.?!;])+"\n"/).each_slice(2).map do |sentence|
      [sentence[0].split, sentence[1]]
    end
  end
end

def join_paragraphs(paragraphs)
  paragraphs.map! do |paragraph|
    paragraph.map do |sentence|
      [sentence[0].join(' '), sentence[1]].join
    end
  end

  paragraphs.map! do |paragraph|
    paragraph.join(' ')
  end.join("\n\n")
end


def match_and_replace(sentence, words_lists)
  sentence.map do |word|
    type_deteced = words_lists.keys.detect do |type|
      words_lists[type].include?(word.downcase)
    end
    if type_deteced
      new_word = words_lists[type_deteced].sample
      word.match(/^[A-Z]/) ? new_word.capitalize : new_word
    else
      word
    end
  end
end


def madlibs(text_file)
  words_lists = build_word_lists
  text = File.read("#{FILES_PATH}#{text_file}")
  paragraphs = split_paragraphs(text)

  paragraphs.map! do |paragraph|
    paragraph.map do |sentence|
      [match_and_replace(sentence[0], words_lists), sentence[1]]
    end
  end

  text = join_paragraphs(paragraphs)
  Dir.mkdir OUTPUT_DIR unless File.directory?(OUTPUT_DIR)
  output_file = "#{OUTPUT_DIR}#{File.basename(text_file, '.txt')}-new_.txt"
  File.open(output_file, "w") { |file| file.write(text) }
end

madlibs('text.txt')
```
