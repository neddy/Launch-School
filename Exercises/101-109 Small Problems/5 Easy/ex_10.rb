# ex_10.rb
# Bannerizer
# Write a method that will take a short line of text, and print it within a box.
#
# Example:
#
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

def enclose_box!(box)
  box[0] << "+"
  box[1] << "|"
  box[2] << "|"
  box[3] << "|"
  box[4] << "+"
  box
end

def create_box(string)
  box = ["", "", "", "", ""]
  enclose_box!(box)
  string.prepend(" ")
  string << " "
  string.chars.each do |char|
    box[0] << "-"
    box[1] << " "
    box[2] << "#{char}"
    box[3] << " "
    box[4] << "-"
  end
  enclose_box!(box)
  box
end

def print_in_box(string)
  box = create_box(string)
  box.each do |line|
    puts line
  end
end

print_in_box('To boldly go where no one has gone before.')


# Recommended solution

def print_in_box(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
