require "todo"
require "todo_list"

RSpec.describe "integration" do
  it "add pushes task to tasks array" do
    todo_list = TodoList.new
    task_1 = Todo.new("wash the car")
    task_2 = Todo.new("hoover")
    todo_list.add(task_1) 
    todo_list.add(task_2)
    expect(todo_list.incomplete).to eq [task_1, task_2]
  end

  it "mark_done! changes #status to true" do
    todo_list = TodoList.new
    task_1 = Todo.new("wash the car")
    task_2 = Todo.new("hoover")
    todo_list.add(task_1) 
    todo_list.add(task_2)
    task_1.mark_done!
    expect(todo_list.incomplete).to eq [task_2]
  end

  it "give_up! moves all incomplete taks to complete" do
    todo_list = TodoList.new
    task_1 = Todo.new("wash the car")
    task_2 = Todo.new("hoover")
    todo_list.add(task_1) 
    todo_list.add(task_2)
    todo_list.give_up!
    expect(todo_list.incomplete).to eq []
    expect(todo_list.complete).to eq [task_1, task_2]
  end
end