require 'pry'

# class RunLengthEncoding
#   def self.encode(input)
#     grouped_characters = [input[0]]
#     previous_char = input[0]
#     current_group = 0
#
#     input[1..-1].chars.each do |char|
#       if char == previous_char
#         grouped_characters[current_group] += char
#       else
#         current_group += 1
#         grouped_characters[current_group] = char
#         previous_char = char
#       end
#     end
#     grouped_characters.map do |chars|
#       chars.size > 1 ? "#{chars.size}#{chars[0]}" : chars
#     end.join
#   end
#
#   def self.decode(input)
#     input.scan(/\d*[^0-9]{1}/).map do |group|
#       if group.size == 1
#         group
#       else
#         group[-1] * group[0..-2].to_i
#       end
#     end.join
#   end
# end

# starting_string = "aAAAAAAAAAAABBBz  CCCC"
# encoded_string = "a11A3Bz2 4C"
# p RunLengthEncoding.encode(starting_string)
# p RunLengthEncoding.decode(encoded_string)

## Version 2
# class RunLengthEncoding
#   def self.encode(input)
#     grouped_characters = input.chars.chunk_while do |current_char, next_char|
#                            current_char == next_char
#                          end.map(&:join)
#
#     grouped_characters.map do |chars|
#       chars.size > 1 ? "#{chars.size}#{chars[0]}" : chars
#     end.join
#   end
#
#   def self.decode(input)
#     input.scan(/\d*[^0-9]{1}/).map do |group|
#       if group.size == 1
#         group
#       else
#         group[-1] * group[0..-2].to_i
#       end
#     end.join
#   end
# end
# starting_string = "aAAAAAAAAAAABBBz  CCCC"
# encoded_string = "a11A3Bz2 4C"
# p RunLengthEncoding.encode(starting_string)
# p RunLengthEncoding.decode(encoded_string)



class RunLengthEncoding
  def self.encode(input)
    input.chars.chunk_while(&:==).map do |group|
      group.size == 1 ? group[0] :"#{group.size}#{group[0]}"
    end.join
  end

  def self.decode(input)
    input.scan(/\d*[^0-9]{1}/).map do |group|
      group.size == 1 ? group : group[-1] * group[0..-2].to_i
    end.join
  end
end

# starting_string = "aAAAAAAAAAAABBBz  CCCC"
# encoded_string = "a11A3Bz2 4C"
# p RunLengthEncoding.encode(starting_string)
# p RunLengthEncoding.decode(encoded_string)
