class TodoList
  def initialize
    @tasks = []
  end

  def add(todo) # todo is an instance of Todo
    @tasks << todo
  end

  def incomplete
    @tasks.select{|task| !task.done?}
  end

  def complete
    @tasks.select{|task| task.done? }
  end

  def give_up!
    @tasks.each{|task| task.mark_done!}
  end
end
