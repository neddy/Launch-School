class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    if new_data <= @data
      if @left
        @left.insert(new_data)
      else
        @left = Bst.new(new_data)
      end
    else
      if @right
        @right.insert(new_data)
      else
        @right = Bst.new(new_data)
      end
    end
    nil
  end

  def each(&block)
    return to_enum(:each) unless block

    @left.each(&block) if @left
    block.call(data)
    @right.each(&block) if @right
    self
  end
end

# four = Bst.new(4)
# four.insert 2
# puts four.left.data


# def record_all_data(bst)
#   all_data = []
#   bst.each { |data| all_data << data }
#   all_data
# end
#
# four = Bst.new 4
# four.insert 2
# four.insert 1
# four.insert 3
# four.insert 6
# four.insert 7
# four.insert 5
# puts record_all_data(four) # assert_equal [1, 2, 3, 4, 5, 6, 7],

# four.each { |data| puts data }
