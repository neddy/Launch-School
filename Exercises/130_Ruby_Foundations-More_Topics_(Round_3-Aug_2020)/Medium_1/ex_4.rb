# ex_4.rb


def split_birds(birds)
  yield(birds)
end


birds = %w(raven finch hawk eagle)

split_birds(birds) do |_, _, *raptors|
  puts raptors
end
