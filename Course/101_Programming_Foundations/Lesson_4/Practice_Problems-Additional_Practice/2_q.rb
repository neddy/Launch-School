# 2_q.rb
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_ages = ages.values.sum
sum_ages_inject = ages.values.inject(:+)
puts sum_ages
puts sum_ages_inject
