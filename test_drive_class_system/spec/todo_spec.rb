require "todo"

RSpec.describe Todo do
  it "returns the task name" do
    task_1 = Todo.new("Wash hair")
    expect(task_1.task).to eq "Wash hair"
  end

  it "masks tasks as done" do
    task_1 = Todo.new("wash the car")
    task_1.mark_done!
    expect(task_1.done?).to eq true
  end
end