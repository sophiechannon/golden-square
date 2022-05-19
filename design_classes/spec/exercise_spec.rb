require "exercise"

RSpec.describe TodoTracker do
  describe "#add_task method" do
    it "fails if passed an empty string" do
      todo = TodoTracker.new
      expect {todo.add_task("")}.to raise_error "Please enter a task."
    end

    it "fails if task given is already on list" do
      todo = TodoTracker.new
      todo.add_task("Walk the dog.")
      expect {todo.add_task("Walk the dog.")}.to raise_error "Task already on list"
    end
  end

  describe "#display_list method" do
    it "displays #list_of_tasks as an array" do
      todo = TodoTracker.new
      todo.add_task("Walk the dog")
      todo.add_task("Clean the floor")
      expect(todo.display_list).to eq ["Walk the dog", "Clean the floor"]
    end

    it "displays 'Nothing to do!' if list is empty" do
      todo = TodoTracker.new
      expect(todo.display_list).to eq "Nothing to do!"
    end
  end

  describe "#complete_task method" do
    it "removes task from list when completed" do
      todo = TodoTracker.new
      todo.add_task("Walk the dog")
      todo.add_task("Clean the floor")
      expect(todo.complete_task("Clean the floor")).to eq ["Walk the dog"]
    end

    it "fails if task isn't on list" do
      todo = TodoTracker.new
      expect {todo.complete_task("Clean the floor")}.to raise_error "Task not on list"
    end
  end
end