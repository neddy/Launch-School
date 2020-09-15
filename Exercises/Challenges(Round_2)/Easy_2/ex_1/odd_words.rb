require 'pry'

class OddWords
  def initialize(string)
    @string = string
  end

  def output
    new_string = @string.gsub(/[^a-z\s]/, " ")
    words = new_string.split(" ")
    reverse_word = false
    words.each do |word|
      word.reverse! if reverse_word
      reverse_word = !reverse_word
    end
    puts words.join(" ") + "."
  end
end

OddWords.new("whats the  matter with 99 kansas.").output


# class OddWords
#   def initialize(string)
#     @string = string
#   end
#
#   def output
#     puts
#     word_even = true
#     current_index = 0
#     first_word = true
#
#     loop do
#       current_char = @string[current_index]
#       if current_char == "."
#         print "."
#         break
#       elsif /[a-z]/i.match(current_char) && word_even
#         print " " unless first_word
#         current_index = output_even(current_index)
#         word_even = !word_even
#         first_word = false
#       elsif /[a-z]/i.match(current_char) && !word_even
#         print " " unless first_word
#         current_index = output_odd(current_index)
#         word_even = !word_even
#         first_word = false
#       end
#       current_index += 1
#     end
#   end
#
#   def output_even(starting_index)
#     current_index = starting_index
#     loop do
#       current_char = @string[current_index]
#       if /[a-z]/i.match(current_char)
#         print current_char
#         current_index += 1
#       else
#         return current_index - 1
#       end
#     end
#   end
#
#   def output_odd(starting_index)
#     last_index = starting_index
#     loop do
#       current_char = @string[last_index]
#       unless /[a-z]/i.match(current_char)
#         last_index -= 1
#         break
#       end
#       last_index += 1
#     end
#     last_index.downto(starting_index).each { |idx| print @string[idx] }
#     last_index
#   end
# end
#
# OddWords.new("whats the  matter with 99 kansas.").output
# Import os

# os.system("clear") # Linux - OSX
# os.system("cls") # Windows

class OddWords
  def initialize(string)
    @string = string
  end

  def output
    system "clear" || "cls"
    @first_word = true
    @word_even = true
    @current_index = 0

    loop do
      current_char = @string[@current_index]
      if current_char == "."
        print "."
        break
      elsif /[a-z]/i.match(current_char)
        output_word
        @word_even = !@word_even
        @first_word = false
      end
      @current_index += 1
    end
  end

  def word_finish_index(starting_index)
    finish_index = starting_index
    loop do
      current_char = @string[finish_index]
      unless /[a-z]/i.match(current_char)
        return finish_index - 1
      end
      finish_index += 1
    end
  end

  def output_word
    print " " unless @first_word
    start_index = @current_index
    finish_index = word_finish_index(@current_index)
    if @word_even
      start_index.upto(finish_index).each { |idx| print @string[idx] }
    else
      finish_index.downto(start_index).each { |idx| print @string[idx] }
    end
    @current_index = finish_index
  end
end

OddWords.new("whats the  matter with  kansas a mate ok.").output
