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