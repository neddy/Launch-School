require 'pry'

class Element
  attr_reader :datum, :next

  def initialize(value, next_element = nil)
    @datum = value
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def push(value)
    @head = Element.new(value, @head)
  end

  def pop
    current_datum = @head.datum
    @head = @head.next
    current_datum
  end

  def peek
    @head ? @head.datum : @head
  end

  def to_a
    array = []
    each { |element| array << element.datum }
    array
  end

  def self.from_a(array)
    return new if array.nil?

    list = new
    array.reverse.each { |value| list.push(value) }
    list
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def empty?
    size == 0
  end

  def size
    count = 0
    each { count += 1 }
    count
  end

  private

  def each
    current_element = @head
    until current_element.nil? do
      yield(current_element)
      current_element = current_element.next
    end
    self
  end
end

# list = SimpleLinkedList.new
# list.push(1)
# list.push(2)
# p list.size
# p list.head.datum
# p list.head.next.datum
