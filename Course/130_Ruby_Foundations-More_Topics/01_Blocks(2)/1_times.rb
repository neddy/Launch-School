


def my_times(n)
  count = 0

  loop do
    break if count >= n
    yield(count)
    count += 1
  end
  n
end


my_times(5) { |num| puts num }
