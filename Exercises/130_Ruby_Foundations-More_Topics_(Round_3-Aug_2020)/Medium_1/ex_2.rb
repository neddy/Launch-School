# ex_2.rb

class TextAnalyzer
  def process
    text = File.read("./ex_2.txt")
    yield(text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts text.split(/\n\n/).size.to_s + " paragraphs" }
analyzer.process { |text| puts text.split(/\n/).size.to_s + " lines" }
analyzer.process { |text| puts text.split(/\s+/).size.to_s + " words" }
