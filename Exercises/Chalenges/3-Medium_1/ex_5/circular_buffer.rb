class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(length)
    @length = length
    @buffer = []
  end

  def clear
    @buffer = []
  end

  def write(element)
    raise BufferFullException if full?
    buffer.unshift(element) unless element == nil
    nil
  end

  def write!(element)
    return if element == nil
    read if full?
    write(element)
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.pop
  end

  private

  attr_reader :length, :buffer

  def full?
    buffer.length == length
  end
end

# buffer = CircularBuffer.new(2)
# buffer.write '1'
# buffer.write '2'
# buffer.write 'A'
