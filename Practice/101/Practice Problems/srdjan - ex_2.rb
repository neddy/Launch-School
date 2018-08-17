# Write function scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
## Only lower case letters will be used (a-z). No punctuation or digits will be included.


# scramble('rkqodlw','world') == true
# scramble('cedewaraaossoqqyt','codewars') == true
# scramble('katas','steak') == false
# scramble('scriptjava','javascript') == true
# scramble('scriptingjava','javascript') == true


# Understand the problem
# find if str2 can be made from a portion of str1
#
# Data
# I: str1 str2
# O: Boolean
# A: arrays
#
# Algorithm
# split strings into arrays (array1, array2)
# loop through each character of array2
#   set index to nil
#   loop through each character of array1
#     return index of item if found
#   end
#   if index not nil
#     delete item and index
#   else
#     return false
#   end
# end
# return true


def scramble(str1, str2)
  array1 = str1.chars
  array2 = str2.chars
  array2.each do |letter2|
    index_found = nil
    array1.each_with_index do |letter1, idx|
      index_found = idx if letter1 == letter2
    end
    if index_found
      array1.delete_at(index_found)
    else
      return false
    end
  end
  true
end


p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true
