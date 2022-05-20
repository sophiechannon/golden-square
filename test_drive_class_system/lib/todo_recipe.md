# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
I want to be able to see outstanding tasks, see completed tasks and be able to complete all tasks at once

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class TodoList
  def initialize
    @complete = []
    @incomplete = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end


class Todo
  def initialize(task) # task is a string
    # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end


```

## 3. Integration test examples

_Make a list of examples of how the class will behave in different situations._

```ruby


# 1 check that add pushes task to #incomplete array

todo_list = TodoList.new
task_1 = Todo.new("wash the car")
task_2 = Todo.new("hoover")
todo_list.add(task_1) 
todo_list.add(task_2)
expect(todo_list.incomplete).to eq [task_1, task_2]

# 2 mark_done! moves task in Todo Class from incomplete to complete

todo_list = TodoList.new
task_1 = Todo.new("wash the car")
task_2 = Todo.new("hoover")
todo_list.add(task_1) 
todo_list.add(task_2)
task_1.mark_done!
expect(todo_list.incomplete).to eq [task_2]
expect(todo_list.complete).to eq [task_1]

# 3 done? check whether task is in complete array and return true or false

todo_list = TodoList.new
task_1 = Todo.new("wash the car")
task_2 = Todo.new("hoover")
todo_list.add(task_1) 
todo_list.add(task_2)
task_1.mark_done!
expect(task_1.done?).to eq true

# 4 give_up! moves all incomplete taks to complete

todo_list = TodoList.new
task_1 = Todo.new("wash the car")
task_2 = Todo.new("hoover")
todo_list.add(task_1) 
todo_list.add(task_2)
todo_list.give_up!
expect(todo_list.incomplete).to eq []
expect(todo_list.complete).to eq [task_1, task_2]

```
## 4. unit test examples

```` ruby
# TodoList class

# 1 

todo_list = TodoList.new => incomplete = []

# Todo Class

# 1 taks returns task

task_1 = Todo.new("Wash hair") => task_1.task = "Wash hair"

# 2 empty string entered

task_1 = Todo.new("") => raise error


````

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

