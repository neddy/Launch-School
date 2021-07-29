NUMBERS = <<-NUMBER.chomp
 _     _  _     _  _  _  _  _
| |  | _| _||_||_ |_   ||_||_|
|_|  ||_  _|  | _||_|  ||_| _|

NUMBER

class OCR
  def initialize(text)
    @text = text
    generate_numbers_list
  end

  def generate_numbers_list
    lines = split_lines(NUMBERS)
    normalised_lines = normalise_lines(lines)
    @numbers_list = split_three_four(normalised_lines)
  end

  def convert
    @lines = split_lines(@text)
    @lines = normalise_lines(@lines)
    @input_blocks = split_three_four(@lines)
    @input_blocks.map { |number| @numbers_list.index(number) || '?' }.join
  end

  def split_three_four(normalised_lines)
    split_by_3 = normalised_lines.map { |line| line.scan(/.{3}/) }
    numbers_arrays = split_by_3[0].zip(split_by_3[1], split_by_3[2])
    numbers_arrays.map { |number| number.join("\n")}
  end

  def split_four_lines(text)
    text.split(/\n/).each_slice(4).map { |slice| slice.join("\n") }
  end

  def split_lines(text)
    text.split("\n")
  end

  def normalise_lines(lines)
    max_line_length = lines.max_by { |line| line.length }.length
    lines.map { |line| line.ljust(max_line_length) }
  end

end


test_0 = <<-NUMBER.chomp
 _
| |
|_|

NUMBER

test_11 = <<-NUMBER.chomp

  |  |
  |  |

NUMBER

test_101 = <<-NUMBER.chomp
    _
  || |  |
  ||_|  |

NUMBER

test_123 = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

NUMBER

test_456 = <<-NUMBER.chomp
    _  _
|_||_ |_
  | _||_|

NUMBER

test_garble = <<-NUMBER.chomp

| |
| |

NUMBER


# puts OCR.new(test_garble).convert
