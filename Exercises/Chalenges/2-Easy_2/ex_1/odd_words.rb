# Take input string of one or more words, seperated by one or more spaces, and terminated by a points. Every odd word should be printed in reverse.

# Notes
# Words can be 20 or less characters (What should we do if they are more?)
# Words may be seperated by multiple spaces
# last word and point may be seperated by spaces.
# every odd word should be printed in reverse

# class OddWords
#   def initialize(string)
#     @input_string = string
#   end
#
#   def output_string
#     words = @input_string.gsub(".", "").split(/\s+/)
#     words = words.map.with_index do |word, idx|
#               idx.odd? ? word.reverse : word
#             end
#     puts words.join(" ") + "."
#   end
# end
#
# oddwords = OddWords.new("This is a  test of    random words .")
# oddwords.output_string

# Bonus - iterate over string character by character

# require 'pry'
#
# class OddWords
#   def initialize(string)
#     @input_string = string
#   end
#
#   def output_string
#     system('clear') || system('cls')
#     raise RuntimeError, "String empty." if string_empty?
#     raise RuntimeError, "No 'point' in string." if missing_point?
#     previous_char = ""
#     current_word = ""
#     previous_word = ""
#     current_word_odd = false
#
#     @input_string.chars.each do |char|
#       case char
#       when " "
#         unless current_word.empty?
#           print current_word
#           current_word_odd = !current_word_odd
#           previous_word = current_word
#           current_word = ""
#         end
#       when /[[:alnum:]]/
#         if current_word_odd
#           current_word.prepend(char)
#         else
#           current_word << char
#         end
#         print " " if previous_char == ' ' && previous_word != ""
#       when "."
#         print "#{current_word}."
#       end
#       previous_char = char
#     end
#   end
#
#   private
#
#   def string_empty?
#     @input_string.empty? || @input_string == " "
#   end
#
#   def missing_point?
#     !@input_string.match(/\./)
#   end
# end
#
# # oddwords = OddWords.new(" This is a  test of    random words .")
# # oddwords.output_string
# #
# oddwords = OddWords.new("   And .")
# oddwords.output_string


class OddWords
  def initialize(string)
    @input_string = string
  end

  def output_string
    system('clear') || system('cls')
    previous_char = ""
    current_word = ""
    previous_word = ""
    current_word_odd = false

    @input_string.chars.each do |char|
      case char
      when " "
        unless current_word.empty?
          print current_word
          current_word_odd = !current_word_odd
          previous_word = current_word
          current_word = ""
        end
      when /[[:alnum:]]/
        if current_word_odd
          current_word.prepend(char)
        else
          current_word << char
        end
        print " " if previous_char == ' ' && previous_word != ""
      when "."
        print "#{current_word}."
      end
      previous_char = char
    end
  end
end

# oddwords = OddWords.new(" This is a  test of    random words .")
# oddwords.output_string
#
# oddwords = OddWords.new("   And .")
# oddwords.output_string
