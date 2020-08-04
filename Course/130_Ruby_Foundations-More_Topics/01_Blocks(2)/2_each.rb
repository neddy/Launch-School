def my_each(collection)
  idx = 0

  while idx < collection.length do
    yield(collection[idx])
    idx += 1
  end
  collection
end

my_array = %w(test testing tested)

my_each(my_array) { |word| puts word }
