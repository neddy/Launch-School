# Write function scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
## Only lower case letters will be used (a-z). No punctuation or digits will be included.

# Scan string one with chars from string 2,
# if all are included then return true
#   remove each matched char to account for double letters.

def scramble(word1, word2)

  word1_array = word1.chars
  word2_array = word2.chars

  word2_array.each do |letter|
    if word1_array.include?(letter)
      word1_array
    else
      return false
    end
  end
  true
end

scramble('rkqodlw','world')

# scramble('rkqodlw','world') == true
# scramble('cedewaraaossoqqyt','codewars') == true
# scramble('katas','steak') == false
# scramble('scriptjava','javascript') == true
# scramble('scriptingjava','javascript') == true
