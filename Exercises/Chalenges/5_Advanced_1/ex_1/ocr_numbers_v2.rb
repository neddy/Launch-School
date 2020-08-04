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
  " _ \n| |\n|_|\n" => '0',
  "   \n  |\n  |\n" => '1',
  " _ \n _|\n|_ \n" => '2',
  " _ \n _|\n _|\n" => '3',
  "   \n|_|\n  |\n" => '4',
  " _ \n|_ \n _|\n" => '5',
  " _ \n|_ \n|_|\n" => '6',
  " _ \n  |\n  |\n" => '7',
  " _ \n|_|\n|_|\n" => '8',
  " _ \n|_|\n _|\n" => '9'
}

class OCR
  def initialize(text)
    @text = text
  end

  def convert
    text.split("\n\n").map do |ocr_line|
      split_ocr_chars(ocr_line).map do |ocr_char|
        NUMBERS.fetch(ocr_char, '?')
      end.join
    end.join(',')
  end

  private

  attr_reader :text

  def split_ocr_chars(ocr_line)
    ocr_chars = []

    normalise_line_length(ocr_line).split("\n").each do |line|
      line.scan(/.{3}/).each_with_index do |chars, idx|
        ocr_chars[idx] ||= []
        ocr_chars[idx] << chars
      end
    end

    ocr_chars.map { |chars| chars.join("\n") + "\n" }
  end

  def normalise_line_length(ocr_line)
    length = ocr_line.split("\n").reduce(3) do |max_length, line|
              line.size > max_length ? line.size : max_length
            end
    length += (3 - length % 3) unless length % 3 == 0

    ocr_line.split("\n").map do |char_line|
      char_line.ljust(length)
    end.join("\n") + "\n"
  end
end

# puts OCR.new(eleven).convert

# NUMBERS.keys.each { |n| puts n }
