# ex_1.rb
#

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

madlibs('trump.txt')
