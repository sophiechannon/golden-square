class Order
  def initialize(customer, menu) # takes a Customer and Menu object
    @customer = customer
    @menu = menu
    @basket = []
  end

  def add(dish, quantity) # takes a dish object
    # adds to the basket array if it has been added to the menu
    # updates quantity of dish
  end

  def basket
    # returns the order @basket
  end

  def remove_item
    #removes an item from the @basket
  end


  def cancel_order
    #empties basket
    # resets dish quantities
  end
end