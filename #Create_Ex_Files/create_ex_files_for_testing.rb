EXERCISES = 10

(1..EXERCISES).each do |n|
  filename = "ex_#{n}.rb"
  file_contents = <<-FILECONTENTS
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_

  end
end
  FILECONTENTS
  file_contents.prepend("# #{filename}\n# \n\n")
  File.open(filename, "w") { |file| file.write(file_contents) }
end
