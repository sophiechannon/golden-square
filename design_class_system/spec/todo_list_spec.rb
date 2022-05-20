require "todo_list"

RSpec.describe TodoList do
  context "initially" do
    it "is empty" do
      list = TodoList.new
      expect(list.tasks).to eq []
    end
  end
end