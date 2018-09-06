=begin
Given a string, find the number character that is repeated most times and return it's numeric value. If multiple characters are repeated the same time, return first one.
If there are no numeric characters in a string return nil.
=end


# p re_letter('There isn\' any number here!') == nil
# p re_letter('%^&*()!') == nil
# p re_letter('111222333') == 1
# p re_letter('1234335521444') == 4
# p re_letter('') == nil
# p re_letter('011-555-333-23') == 3
# p re_letter('1') == 1
# p re_letter('444352893599119') == 9
