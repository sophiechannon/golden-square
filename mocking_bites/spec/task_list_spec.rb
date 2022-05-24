require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour

  it "adds and returns a list of tasks" do
    task_list = TaskList.new
    task_1 = double :Task1
    task_2 = double :Task2
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "returns true if all tasks complete" do
    task_list = TaskList.new
    task_1 = double :Task1, complete?: true
    task_2 = double :Task2, complete?: true
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all_complete?).to eq true
  end

  it "returns false if there are any outstanding tasks" do
    task_list = TaskList.new
    task_1 = double :Task1, complete?: true
    task_2 = double :Task2, complete?: false
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all_complete?).to eq false
  end
end
