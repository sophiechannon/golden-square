class Todo
  def initialize(task) # task is a string
    @task = task
    @status = false
  end

  def task
    @task
  end

  def mark_done!
    @status = true
  end

  def done?
    @status
  end
end