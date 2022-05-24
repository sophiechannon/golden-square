require "task_formatter"

RSpec.describe TaskFormatter do
  it "returns the task as a string indicating task is complete" do
    task_1 = double :task, title: "dusting", complete?: true
    formatted_task = TaskFormatter.new(task_1)
    expect(formatted_task.format).to eq "[x] dusting"
  end

  it "returns the task as a string indicating task is not complete" do
    task_1 = double :task, title: "dusting", complete?: false
    formatted_task = TaskFormatter.new(task_1)
    expect(formatted_task.format).to eq "[ ] dusting"
  end
end