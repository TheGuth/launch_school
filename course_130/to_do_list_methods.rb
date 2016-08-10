# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.
require 'pry'

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

  def add(item)
    if item.class == Todo
      @todos << item
    end
    @todos
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos[index]
  end

  def mark_done_at(item)
    @todos[item].done!
  end

  def mark_undone_at(item)
    @todos[item].undone!
  end

  def pop
    @todos.pop
  end

  def shift
    @todos.shift
  end

  def remove_at(item)
    @todos.delete_at(item)
  end

  def to_s
    @todos.each do |item|
      puts "#{item}"
    end
  end

  def each
    counter = 0
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
  end

  def select
    result = TodoList.new(title)
    @todos.each do |item|
      result.add(item) if yield(item)
    end
    result
  end

  def find_by_title(string)
    @todos.each do |item|
      if item.title.include?(string)
        return item
      end
    end
  end

  def all_done
    @todos.select do |item|
      item.done?
    end
  end

  def all_not_done
    @todos.select do |item|
      !item.done?
    end
  end

  def mark_done(string)
    @todos.each do |item|
      if item.title.include?(string)
        item.done!
      end
    end
  end

  def mark_all_done
    @todos.each do |item|
      item.done!
    end
  end

  def mark_all_undone
    @todos.each do |item|
      item.undone!
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_done_at(0)
list.mark_done_at(2)

list.mark_done('Clean room')

p list.find_by_title('Buy milk')
p list.all_done
p list.all_not_done

p list.mark_all_undone
p list. mark_all_done



# or

class TodoList

  # ... rest of code omitted for brevity

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

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end
