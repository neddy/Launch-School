# 2_q.rb
def test_return
  ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
  end
end

puts test_return
