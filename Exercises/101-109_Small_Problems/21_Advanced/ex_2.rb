# ex_2.rb
# Seeing Stars

def star_array(n)
  array = []
  star_count = 3
  while star_count <= n do
    array << star_count
    star_count += 2
  end
  array.reverse + [n] + array
end

def star(n)
  full_line = false
  array = star_array(n)
  array.map! do |line|
    half_spaces_count = line - 3 == 0 ? 0 : (line - 3) / 2
    if full_line && line == n
      full_line = !full_line
      '*' * n
    else
      full_line = !full_line if line == n
      '*' + (' ' * half_spaces_count) + '*' + (' ' * half_spaces_count) + '*'
    end
  end
  array.each do |line|
    puts line.center(n)
  end
end

star(7)
star(9)

# Refactored

def create_star_line(line)
  if line == 3
    '*' * 3
  else
    spaces = (line - 3)/2
    '*' + (' ' * spaces) + '*' + (' ' * spaces) + '*'
  end
end

def star(n)
  array_numbers = []
  n.downto(3) do |line|
    array_numbers << line if line.odd?
  end
  array_chars = array_numbers.map do |line|
    create_star_line(line)
  end
  array_chars << ['*' * n]
  array_chars << array_numbers.reverse.map do |line|
    create_star_line(line)
  end
  array_chars.flatten.each do |line|
    puts line.center(n)
  end
end

star(7)
star(9)
