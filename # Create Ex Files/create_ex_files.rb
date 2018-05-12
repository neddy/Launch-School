exercises = 10
(1..exercises).each do |n|
  filename = "ex_#{n}.rb"
  File.open(filename, "w") { |file| file.write("# #{filename}\n# ") }
end
