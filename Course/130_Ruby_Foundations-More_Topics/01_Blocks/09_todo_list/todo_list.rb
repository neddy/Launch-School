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

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
#
# puts todo1
# puts todo2
# puts todo3
#
# todo1.done!
#
# puts todo1
# puts todo2
# puts todo3


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
    raise TypeError, "Can only add Todo objects" unless todo.class == Todo
    todos << todo
    todos
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    result = TodoList.new(title)
    each do |todo|
      result << todo if yield(todo)
    end
    result
  end

  def find_by_title(todo_title)
    select { |todo| todo.title == todo_title }.first
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(todo_title)
    find_by_title(todo_title) && find_by_title(todo_title).done!
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  def to_s
    string = "--- #{title} ---\n"
    string << todos.map(&:to_s).join("\n")
    string
  end

  def to_a
    todos.to_a
  end

  private

  attr_accessor :todos

end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list << todo3                 # adds todo3 to end of list, returns list
# # list.add(1)
#
# # <<
# # same behavior as add
#
# # ---- Interrogating the list -----
#
# # size
# puts list.size                       # returns 3
#
# # first
# puts list.first                      # returns todo1, which is the first item in the list
#
# # last
# puts list.last
#
#
# # item_at
# # list.item_at                    # raises ArgumentError
# puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# # list.item_at(100)               # raises IndexError
#
# # ---- Marking items in the list -----
#
# # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# # list.mark_done_at(100)          # raises IndexError
# puts list
#
# # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# # list.mark_undone_at(100)        # raises IndexError
# puts list
#
# # ---- Deleting from the the list -----
#
# # shift
# puts list.shift                      # removes and returns the first item in list
# puts list
#
# # pop
# puts list.pop                        # removes and returns the last item in list
# puts list
#
# new_list = TodoList.new("Today's Todos")
# new_list.add(todo1)                 # adds todo1 to end of list, returns list
# new_list.add(todo2)                 # adds todo2 to end of list, returns list
# new_list << todo3
#
# # remove_at
# # new_list.remove_at                  # raises ArgumentError
# new_list.remove_at(1)               # removes and returns the 2nd item
# # new_list.remove_at(100)             # raises IndexError
# puts new_list

# list.each do |todo|
#   puts todo
# end



# todo1.done!
# results = list.select { |todo| todo.done? }    # you need to implement this method
# puts results.inspect

# puts list.find_by_title("Go to gym")

list.mark_done("Go to gym")
puts list.all_done
puts list.all_not_done

list.mark_all_done
puts list
list.mark_all_undone
puts list
