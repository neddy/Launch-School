def joinor(arr, separator = ', ', join_word = 'or')
  output = ''
  if arr.length > 2
    counter = 0
    loop do
      if counter == arr.length - 1
        output += join_word + ' ' + arr[counter].to_s
        break
      else
        output += arr[counter].to_s + separator
        counter += 1
      end
    end
  else
    output = arr.join(" #{join_word} ")
  end
  output
end

puts joinor([1, 2])                   # => "1 or 2"
puts joinor([1, 2, 3])                # => "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
