class CircularBuffer
  class BufferEmptyException < StandardError;end
  class BufferFullException < StandardError;end

  def initialize(length)
    @length = length
    clear
  end

  def read
    value = @buffer.shift
    raise BufferEmptyException if value.nil?
    value
  end

  def write(value)
    return nil if value.nil?
    raise BufferFullException if full?
    @buffer << value
  end

  def clear
    @buffer = []
  end

  def write!(value)
    return nil if value.nil?
    read if full?
    write(value)
  end

  private

  def full?
    @buffer.size == @length
  end
end


# buffer = CircularBuffer.new(1)
# buffer.write 1
# buffer.write! 1
