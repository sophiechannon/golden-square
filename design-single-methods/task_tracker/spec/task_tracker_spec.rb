require "task_tracker"

RSpec.describe "Checking if #TODO is in the string" do
  it "Returns True if #TODO is present" do 
    expect(todo_checker("Grocery Shopping #TODO")).to eq true
  end 
  it "Returns False if #TODO is not present" do 
    expect(todo_checker("Homework done")).to eq false
  end 
  it "Returns False if it is an empty string" do 
    expect(todo_checker("")).to eq false
  end 
end