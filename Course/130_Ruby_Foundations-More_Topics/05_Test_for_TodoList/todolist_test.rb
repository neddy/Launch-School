require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos.size - 1, @list.size)
    assert_includes(@list.to_a, @todo2)
    assert_includes(@list.to_a, @todo3)
    refute_includes(@list.to_a, @todo1)
  end

  # LS Answer
  # def test_shift
  #   todo = @list.shift
  #   assert_equal(@todo1, todo)
  #   assert_equal([@todo2, @todo3], @list.to_a)
  # end

  def test_pop
    assert_equal(@list.pop, @todo3)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @todos.each { |todo| todo.done! }
    assert(@list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add("x") }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel
    todo4 = Todo.new("Test")
    @list << todo4
    assert_same(todo4, @list.pop)
  end

  def test_add_alias
    todo4 = Todo.new("Test")
    @list.add(todo4)
    assert_same(todo4, @list.pop)
  end

  def test_item_at
    @todos.each_with_index do |todo, idx|
      assert_same(todo, @list.item_at(idx))
    end
    out_of_range_idx = @todos.size
    assert_raises(IndexError) { @list.item_at(out_of_range_idx) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert(@todo1.done?)
    @list.mark_done_at(2)
    assert(@todo3.done?)

    out_of_range_idx = @todos.size
    assert_raises(IndexError) { @list.mark_done_at(out_of_range_idx)}
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    @list.mark_undone_at(2)
    assert_equal(false, @todo3.done?)
    assert_equal(true, @todo2.done?)

    out_of_range_idx = @todos.size
    assert_raises(IndexError) { @list.mark_done_at(out_of_range_idx)}
  end

  def test_done!
    @list.done!
    @todos.each { |todo| assert_equal(true, todo.done?) }
    assert_equal(true, @list.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    @todos.each { |todo| assert_equal(true, todo.done?) }
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    out_of_range_idx = @todos.size
    assert_raises(IndexError) { @list.remove_at(out_of_range_idx)}

    removed_todo = @list.remove_at(1)
    assert_same(@todo2, removed_todo)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    counter = 0
    @list.each do |todo|
      assert_same(@todos[counter], todo)
      counter += 1
    end
  end

  def test_each_return
    assert_same(@list, @list.each { |todo| nil })
  end

  def test_select
    new_list = @list.select { |todo| !todo.done? }
    assert_equal(@list, new_list)

    @list.mark_done_at(1)
    new_list = @list.select { |todo| todo.done? }
    assert_same(@todo2, new_list.first)
  end
end
