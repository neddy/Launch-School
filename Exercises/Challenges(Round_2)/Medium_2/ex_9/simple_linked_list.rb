require 'pry'

class Element
  attr_reader :next, :datum

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size

  def initialize
    @size = 0
    @linked_list = Element.new(nil)
  end

  def push(data)
    @linked_list = if empty?
                     Element.new(data)
                   else
                     Element.new(data ,@linked_list)
                   end
    @size += 1
    nil
  end

  def empty?
    @size == 0
  end

  def head
    @linked_list
  end

  def peek
    head.datum
  end

  def pop
    return nil if size == 0

    @size -= 1
    poped_value = @linked_list.datum
    @linked_list = @linked_list.next
    poped_value
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list unless array.instance_of?(Array) && !array.empty?

    array.reverse.each { |el| new_list.push(el) }
    new_list
  end

  def to_a
    array = []
    loop do
      value = pop
      break if value.nil?
      array << value
    end
    array
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end

# p SimpleLinkedList.from_a([1]).to_a
# l = SimpleLinkedList.from_a(nil)
# puts l.size
# puts l.peek.nil?

# l = SimpleLinkedList.new
# puts l.size


# e1 = Element.new(1)
# e2 = Element.new(2, e1)
# puts e1 == e2.next

# l = SimpleLinkedList.new
# l.push(1)
# puts l.size
# puts l.peek

# skip
# l = SimpleLinkedList.new
# l.push(1)
# puts l.head.class
# puts l.head.datum
# puts l.head.tail?
