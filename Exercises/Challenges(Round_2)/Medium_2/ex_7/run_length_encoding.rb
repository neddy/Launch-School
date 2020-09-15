class RunLengthEncoding
  def self.encode(input)
    regex = Regexp.new("#{input.chars.uniq.join("+|")}+")
    repeaded_chars = input.scan(regex)
    repeaded_chars.map do |chars|
      chars.size > 1 ?"#{chars.size}#{chars[0]}" : "#{chars[0]}"
    end.join
  end

  def self.decode(input)
    input.scan(/(\d*)(\D)/).map do |n, char|
      n.empty? ? char : char * n.to_i
    end.join
  end
end

# input = 'AABBBCCCC'
# output = '2A3B4C'
# p RunLengthEncoding.encode(input)
# p RunLengthEncoding.decode(output)


# LS Answer
# module RunLengthEncoding
#   def self.encode(input)
#     input.gsub(/(.)\1{1,}/) { |match| match.size.to_s + match[0] }
#   end
#
#   def self.decode(input)
#     input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
#   end
# end
#
# input = 'AABBBCCCCDZ'
# output = '2A3B4C'
# p RunLengthEncoding.encode(input)
# p RunLengthEncoding.decode(output)
