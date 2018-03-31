# ex_4.rb
# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
puts arr1.inspect

arr2[2] = 4
puts arr2.inspect

hsh1[:first][2][0] = 4
puts hsh1.inspect

hsh2[['a']][:a][2] = 4
puts hsh2.inspect
