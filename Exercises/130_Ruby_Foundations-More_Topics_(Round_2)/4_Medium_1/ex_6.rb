# ex_6.rb
# Method to Proc


def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

puts  [8, 10, 12, 14, 16, 33].map(&a_proc) == [10, 12, 14, 16, 20, 41]



# Just wanted to see if I could do this without using `to_s(n)`...
# def convert_to_base_8(n)
#   eights, remainder = n.divmod(8)
#   (eights * 10) + remainder
# end
#
# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc
#
# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)
#
# # puts  [8, 10, 12, 14, 16, 33].map(&a_proc) == [10, 12, 14, 16, 20, 41]
