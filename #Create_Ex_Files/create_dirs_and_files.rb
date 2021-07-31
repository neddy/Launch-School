require 'fileutils'

(1..20).each do |n|
  question = "q_#{n}"
  Dir.mkdir(question)
  File.write("#{question}/#{question}.md", "# #{question}.md\n\n")
  File.write("#{question}/#{question}.rb", "# #{question}.rb\n\n")
end
