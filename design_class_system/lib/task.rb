class Task
  def initialize(task)
    @task = task
    @is_complete = false
  end

  def name
    @task
  end

  def status
    @is_complete
  end

  def mark_complete
    @is_complete = true
  end
end