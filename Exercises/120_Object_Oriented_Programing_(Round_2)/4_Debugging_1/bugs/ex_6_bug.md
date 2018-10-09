Hi,

I think the conversion units are mixed up for Mile and and Nautical Mile, as a Nautical mile is longer than a mile [Nautical mile Wikipedia](https://en.wikipedia.org/wiki/Nautical_mile). [Convert Mile to Nautical Mile](https://bit.ly/2QxmyaL), [Convert Nautical Mile to Mile](https://bit.ly/2QwLHT1).

I swapped the number next to `nmi:` in `as_mile` with the number next to `mi:` in `as_nautical_miles` and now the conversions are correct I believe.

Changed code:
```ruby
  def as_kilometers
    convert_to(:km, { km: 1, mi: 1.609344, nmi: 1.8519993 })
  end

  def as_miles
    convert_to(:mi, { km: 0.62137119, mi: 1, nmi: 1.15078 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 0.539957, mi: 0.8689762419, nmi: 1 })
  end
```

New output
```ruby
puts Length.new(1, :mi).as_nautical_miles # => 0.869 nmi
puts Length.new(1, :nmi).as_miles         # => 1.1508 mi

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# expected output:
# 1 km
# 1 mi
# 1 nmi
```


Original code:
```ruby
  def as_kilometers
    convert_to(:km, { km: 1, mi: 1.609344, nmi: 1.8519993 })
  end

  def as_miles
    convert_to(:mi, { km: 0.62137119, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 0.539957, mi: 1.15078, nmi: 1 })
  end
```

Original output:
```ruby
puts Length.new(1, :mi).as_nautical_miles # => 1.1508 mi
puts Length.new(1, :nmi).as_miles         # => 0.869 nmi

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# expected output:
# 1 km
# 1 nmi
# 1 mi
```

Cheers,
Ned
