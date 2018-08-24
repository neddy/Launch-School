# ex_1.rb
#

def longest_sentence(text_file)
  text = File.read(text_file)
  sentences = text.split(/(?<=[.!?])/)
  sentences.map!{ |sentence| sentence.split(' ') }
  sentences.sort_by!{ |sentence| sentence.size }
  puts "The longest sentence is #{sentences.last.size} words long:"
  puts
  puts sentences.last.join(" ")
end

# longest_sentence('ex_1_txt.txt')

def longest_word(text_file)
  text = File.read(text_file)
  sentences = text.split(/\W/)
  puts sentences.max_by {|word| word.size }
end

longest_word('ex_1_txt.txt')
