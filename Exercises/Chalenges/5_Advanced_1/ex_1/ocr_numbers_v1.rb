require 'pry'

zero = <<-NUMBER.chomp
 _
| |
|_|

NUMBER

one = <<-NUMBER.chomp

  |
  |

NUMBER

two = <<-NUMBER.chomp
 _
 _|
|_

NUMBER

three = <<-NUMBER.chomp
 _
 _|
 _|

NUMBER

four = <<-NUMBER.chomp

|_|
  |

NUMBER

five = <<-NUMBER.chomp
 _
|_
 _|

NUMBER

six = <<-NUMBER.chomp
 _
|_
|_|

NUMBER

seven = <<-NUMBER.chomp
 _
  |
  |

NUMBER

eight = <<-NUMBER.chomp
 _
|_|
|_|

NUMBER

nine = <<-NUMBER.chomp
 _
|_|
 _|

NUMBER

ten = <<-NUMBER.chomp
    _
  || |
  ||_|

NUMBER

eleven = <<-NUMBER.chomp

  |  |
  |  |

NUMBER

fourty_four = <<-NUMBER.chomp

|_||_|
  |  |

NUMBER

multi_line = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER

NUMBERS = {
  " _\n| |\n|_|\n" => '0',
  "\n  |\n  |\n" => '1',
  " _\n _|\n|_\n" => '2',
  " _\n _|\n _|\n" => '3',
  "\n|_|\n  |\n" => '4',
  " _\n|_\n _|\n" => '5',
  " _\n|_\n|_|\n" => '6',
  " _\n  |\n  |\n" => '7',
  " _\n|_|\n|_|\n" => '8',
  " _\n|_|\n _|\n" => '9'
}

class OCR
  def initialize(text)
    @text = text
  end

  def convert
    text.split("\n\n").map { |line| convert_single_line(line) }.join(",")
  end

  def convert_single_line(line)
    split_numbers(line).map { |char| convert_single_block(char) }.join
  end

  private

  attr_reader :text

  def split_numbers(text)
    numbers = []
    text.split("\n").each do |line|
      line.scan(/.{1,3}|^$/).each_with_index do |number_line, number_idx|
        numbers[number_idx] ||= []
        numbers[number_idx] << number_line
      end
    end

    numbers.each { |char| char.prepend('') if char[0].include?('|') }
    numbers.map { |char| char.map(&:rstrip).join("\n") + "\n" }
  end

  def convert_single_block(block)
    NUMBERS.fetch(block, '?')
  end
end

# puts OCR.new(eleven).convert
