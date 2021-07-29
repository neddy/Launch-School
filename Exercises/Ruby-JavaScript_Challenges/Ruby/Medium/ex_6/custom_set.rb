class CustomSet
  def initialize(array = [])
    @set = {}
    array.each { |value| @set[value] = nil }
  end

  def empty?
    @set.empty?
  end

  def contains?(value)
    @set.include?(value)
  end

  def subset?(other_set)
    @set.all? { |key, _| other_set.contains?(key) }
  end

  def subset?(other_set)
    @set.all? { |key, _| other_set.contains?(key) }
  end

  def disjoint?(other_set)
    @set.none? { |key, _| other_set.contains?(key) }
  end

  def intersection(other_set)
    new_set = CustomSet.new
    each { |value| new_set.add(value) if other_set.contains?(value) }
    new_set
  end

  def difference(other_set)
    new_set = CustomSet.new
    each { |value| new_set.add(value) unless other_set.contains?(value) }
    new_set
  end

  def union(other_set)
    other_set.each { |value| add(value) }
    self
  end

  def eql?(other_set)
    size == other_set.size && subset?(other_set)
  end

  alias_method "==", "eql?"

  def add(value)
    @set[value] = nil
    self
  end

  protected

  def size
    @set.size
  end

  def each
    @set.keys.each { |key| yield(key) }
    self
  end
end
