require 'simplecov'
SimpleCov.start

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
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)

    @todo1.done!
    assert_equal(false, @list.done?)

    @todos.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) do
      @list.add(1)
    end
    assert_raises(TypeError) do
      @list.add("hi")
    end
  end

  def test_shovel
    todo4 = Todo.new("Test todo...")
    @list << todo4
    assert_includes(@list.to_a, todo4)
  end

  def test_add
    todo4 = Todo.new("Test todo...")
    @list.add(todo4)
    assert_includes(@list.to_a, todo4)
  end

  def test_item_at
    assert_raises(ArgumentError) { @list.item_at }
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(ArgumentError) { @list.mark_done_at }
    assert_raises(IndexError) { @list.mark_done_at(100) }

    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(ArgumentError) { @list.mark_undone_at }
    assert_raises(IndexError) { @list.mark_undone_at(100) }

    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    assert_equal(false, @todos.all? { |todo| todo.done? })
    @list.done!
    assert_equal(true, @todos.all? { |todo| todo.done? })
  end

  def test_remove_at
    assert_raises(ArgumentError) { @list.remove_at }
    assert_raises(IndexError) { @list.remove_at(100) }

    assert_equal(@todo2, @list.remove_at(1))
    refute_includes(@list.to_a, @todo2)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @todo2.done!
    assert_equal(output, @list.to_s)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @todos.each { |todo| todo.done! }
    assert_equal(output, @list.to_s)
  end

  def test_each
    test_array = []

    @list.each { |todo| test_array << todo }
    assert_equal(@todos, test_array)

    assert_equal(@list, @list.each {})
  end

  def test_select
    refute_same(@list, @list.select { |todo| true })


    selected_todos = @list.select { |todo| todo.title == "Clean room" }
    assert_equal([@todo2], selected_todos.to_a)
    assert_instance_of(TodoList, selected_todos)
  end

  def test_find_by_title
    assert_equal(@todo2, @list.find_by_title("Clean room"))
    assert_nil(@list.find_by_title("Non-existent todo..."))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    @todo1.done!
    assert_equal([@todo1], @list.all_done.to_a)
    @todo2.done!
    assert_equal([@todo1, @todo2], @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal(@todos, @list.all_not_done.to_a)
    @todo2.done!
    assert_equal([@todo1, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    assert_raises(ArgumentError) { @list.mark_done }

    @list.mark_done("Non-existent todo...")
    assert_equal(0, @list.all_done.size)

    @list.mark_done("Clean room")
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    assert_equal(0, @list.all_done.size)

    @list.done!
    @list.mark_all_undone
    assert_equal(0, @list.all_done.size)
  end

end
