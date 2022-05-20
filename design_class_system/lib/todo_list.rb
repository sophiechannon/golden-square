class TodoList
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def tasks
    @tasks.select {|task| !task.status}
  end
end