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
    if @dishes.empty?
      print_out_of_stock_message
    elsif all.any? { |dish| dish.quantity > 0 } 
      print_header
      print_dishes
    else
      print_out_of_stock_message
    end
  end

  private

  def print_dishes
    all.each do |dish|
      @terminal.puts "#{dish.name} (£#{dish.price})" if dish.quantity > 0
    end
  end

  def print_header
    @terminal.puts "---Menu---"
  end

  def print_out_of_stock_message
    @terminal.puts "Restaurant out of stock!"
  end
end

# menu = Menu.new(Kernel)
# dish_1 = Dish.new("Ch*cken burger", 12, 5)
# dish_2 = Dish.new("Loaded fries", 6, 6)
# dish_3 = Dish.new("Chocolate m*lkshake", 4, 7)
# menu.add(dish_1)
# menu.add(dish_2)
# menu.add(dish_3)
# menu.view_all