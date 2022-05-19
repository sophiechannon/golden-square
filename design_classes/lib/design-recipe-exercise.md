# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class TodoTracker
  def initialize
    @list_of_tasks = []
  end

  def add_task(task)
    # adds task to #list of tasks
    # confirms added and displays list - BONUS
  end

  def display_list
    # displays list as bullet pointed list
  end

  def complete_task(task)
    # removes task from list
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
todo = TodoTracker.new
expect(todo.add_task("Walk the dog")).to eq ["Walk the dog"] #list of tasks

# add a fail if string is empty
# error if already on list - BONUS

# 2
todo = TodoTracker.new
todo.add_task("Walk the dog")
todo.add_task("Clean the floor")
expect(todo.display_list).to eq "- Walk the dog\n- Clean the floor" #list of tasks displayed as list

# return "Nothing to do!" if #list_of_tasks is empty

# 3 
todo = TodoTracker.new
todo.add_task("Walk the dog")
todo.add_task("Clean the floor")
expect(todo.complete_task("Clean the floor")).to eq "- Walk the dog"

# fail if task is not in the list

```


_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

