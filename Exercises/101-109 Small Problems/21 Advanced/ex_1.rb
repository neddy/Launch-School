# ex_1.rb
# Madlibs Revisited

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

def insert_placeholders_puncts_paragraphs(text)
  text.gsub!(/([[:punct:]])/, " {{\\1}}")
  text.gsub!(/(\n\n)/, " {{PARAGRAPH}} ")
  text
end

def remove_placeholders(text)
  text.gsub!(/( {{[[:punct:]]}})/){ |match| match[3]}
  text.gsub!(/( {{PARAGRAPH}} )/, "\n\n")
  text
end

def replace_words(text)
  words_lists = build_word_lists
  text_words = text.split(' ')
  new_words = text_words.map do |word|
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
  new_words.join(' ')
end

def madlibs(input_file, copies=1)
  text = File.read("#{FILES_PATH}#{input_file}")
  text = insert_placeholders_puncts_paragraphs(text)
  Dir.mkdir OUTPUT_DIR unless File.directory?(OUTPUT_DIR)
  (1..copies).each do |copy|
    new_text = replace_words(text)
    new_text = remove_placeholders(new_text)
    output_file = "#{OUTPUT_DIR}#{File.basename(input_file, '.txt')}-new_#{copy}.txt"
    File.open(output_file, "w") { |file| file.write(new_text) }
  end
  puts "Done, #{copies} copies created."
end

madlibs("trump.txt", 10)
