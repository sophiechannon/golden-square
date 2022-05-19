require "exercise"

RSpec.describe TodoTracker do
  describe "#add_task method" do
    it "fails if passed an empty string" do
      todo = TodoTracker.new
      expect {todo.add_task("")}.to raise_error "Please enter a task."
    end

    it "returns #list_of_tasks as array if valid string is entered" do
      todo = TodoTracker.new
      expect(todo.add_task("Walk the dog")).to eq ["Walk the dog"]
    end
  end
end