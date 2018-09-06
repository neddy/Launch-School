# ex_14.rb
# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
arr = []
counter = 0
hsh.each do |k, v|
  arr[counter] = []
  arr[counter][0] = k
  if v[:type] == 'fruit'
    arr[counter][1] = v[:colors].each {|x| x.capitalize!}
  else
    arr[counter][1] = v[:size].upcase
  end
  counter += 1
end

p arr

# Suggested solution

arr = hsh.map do |k, v|
  if v[:type] == 'fruit'
    v[:colors].map {|color| color.capitalize}
  else
    v[:size].upcase
  end
end

p arr
