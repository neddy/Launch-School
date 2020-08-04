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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(todo)
    raise TypeError.new("Can only add Todo objects") unless todo.class == Todo
    @todos << todo
  end

  alias << add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.dup
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
    nil
  end

  def mark_undone_at(index)
    item_at(index).undone!
    nil
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  alias mark_all_done done!

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |todo| new_list << todo if yield(todo) }
    new_list
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
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

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def to_s
    "---- #{title} ----\n" + @todos.join("\n")
  end
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
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# # size
# p list.size                       # returns 3
#
# # first
# p list.first                      # returns todo1, which is the first item in the list
#
# # last
# list.last                       # returns todo3, which is the last item in the list
#
# #to_a
# p list.to_a                      # returns an array of all items in the list
#
# #done?
# todo1.done!
# todo2.done!
# todo3.done!
# p list.done?                     # returns true if all todos in the list are done, otherwise false
#
# # ---- Retrieving an item in the list ----
#
# # item_at
# p list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError
#
# # ---- Marking items in the list -----
#
# # mark_done_at
# p list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# p list.mark_done_at(100)          # raises IndexError
#
# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError
#
# # done!
# p list.done?
# list.done!                      # marks all items as done
# p list.done?
#
# # ---- Deleting from the list -----
#
# # shift
# list.shift                      # removes and returns the first item in list
#
# # pop
# list.pop                        # removes and returns the last item in list
#
# # remove_at
# list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError
#
# # ---- Outputting the list -----
#
# # to_s
# list.to_s                      # returns string representation of the list
#
# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym
#
# # or, if any todos are done
#
# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym


# each
# puts list
#
# list.each { |todo| todo.done! }
#
# puts list

# select

# todo1.done!
#
# results = list.select { |todo| todo.done? }    # you need to implement this method
#
# puts results

# Find By Title
# p list.find_by_title("Go to gym")

# All Done / All Not Done

# todo3.done!
# p list.all_done
# p list.all_not_done

# Mark Done

# list.mark_done("Go to gym")
# puts list
#
# # Mark All Done
#
# list.mark_all_done
# puts list
#
# # Mark all undone
#
# list.mark_all_undone
# puts list
