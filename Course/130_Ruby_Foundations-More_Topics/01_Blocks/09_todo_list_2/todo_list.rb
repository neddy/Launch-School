# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless is_a_todo?(todo)
    self.todos << todo
  end

  alias :<< :add

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(place)
    todos.fetch(place)
  end

  def mark_done_at(place)
    item_at(place).done!
  end

  def mark_undone_at(place)
    item_at(place).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(place)
    @todos.delete(item_at(place))
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |todo| new_list.add(todo) if yield(todo) }
    new_list
  end

  # def find_by_title(title)
  #   list = select { |todo| todo.title.downcase == title.downcase }
  #   begin
  #     list.item_at(0)
  #   rescue IndexError
  #     nil
  #   end
  # end

  def find_by_title(title)
    select { |todo| todo.title.downcase == title.downcase }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def to_s
    string = "---- #{title} ----\n"
    todos.each { |todo| string << "#{todo} \n" }
    string
  end

  protected

  attr_accessor :todos

  def is_a_todo?(element)
    element.is_a?(Todo)
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Buy milks")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

list.mark_done("Buy milk")

puts list.all_done
