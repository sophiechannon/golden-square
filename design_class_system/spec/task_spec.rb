require "task"

RSpec.describe Task do
  it "returns the task" do
    task = Task.new("mop the floor")
    expect(task.name).to eq "mop the floor"
  end
end