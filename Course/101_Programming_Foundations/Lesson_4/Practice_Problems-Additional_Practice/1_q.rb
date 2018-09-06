# 1_q.rb
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flinstones_hash = {}

flintstones.each_with_index do |element, index|
  flinstones_hash[element] = index
end
p flinstones_hash
