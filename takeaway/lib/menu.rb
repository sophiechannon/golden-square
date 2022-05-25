class Menu
  def initialize(terminal) # Initializes with kernal for putsing
    @terminal = terminal
    @dishes = []
  end

  def add(dish) # takes a dish object
    @dishes << dish
  end

  def all
    return @dishes
  end

  def view_all
  # returns (or puts) the menu by category, formatted to show dish and price
  end

end