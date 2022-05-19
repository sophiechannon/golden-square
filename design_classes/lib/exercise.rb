class TodoTracker
  def initialize
    @list_of_tasks = []
  end

  def add_task(task)
    fail "Please enter a task." if task == ""
  end
end