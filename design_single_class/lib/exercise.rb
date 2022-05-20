class TodoTracker
  def initialize
    @list_of_tasks = []
  end

  def add_task(task)
    if task == ""
      fail "Please enter a task."
    elsif @list_of_tasks.include?(task)
      fail "Task already on list"
    end
    @list_of_tasks << task
  end

  def display_list
    if @list_of_tasks.empty?
      return "Nothing to do!"
    else
      return @list_of_tasks
    end
  end

  def complete_task(task)
    fail "Task not on list" if !@list_of_tasks.include?(task)
    @list_of_tasks.delete(task)
    return @list_of_tasks
  end
end