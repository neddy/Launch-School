EXERCISES = 10

(1..EXERCISES).each do |n|
  filename = "ex_#{n}.rb"
  File.open(filename, "w") { |file| file.write("# #{filename}\n# ") }
end
