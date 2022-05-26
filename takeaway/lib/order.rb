$LOAD_PATH << File.dirname(__FILE__)
require "dish.rb"
require "customer.rb"
require "menu.rb"
require "confirmation_text.rb"

class Order
  def initialize(customer, menu) # takes a Customer and Menu object
    @customer = customer
    @menu = menu
    @basket = []
  end

  def add(dish, qty) # takes a dish object
    fail dish_not_available if !@menu.all.include?(dish)
    fail dish_not_available if dish.quantity < 1
    fail "There are only #{dish.quantity} #{dish.name} in stock" if dish.quantity < qty
    basket << {dish: dish, qty: qty}
    dish.quantity -= qty
  end

  def basket
    @basket
  end

  def customer
    @customer
  end

  def remove(dish, qty)
    fail "Item not in basket" if basket.all? { |h| h[:dish] != dish }
    basket.each do |item|
      item[:qty] -= qty if item[:dish] == dish # reduces the quantity in the basket
    end
    dish.quantity += qty # adds the quantity back to the Dish object
    basket.delete_if {|h| h[:qty] < 1} # if the quantity of the item in the basket is now 0, remove it
  end

  def cancel
    basket.each do |item|
      item[:dish].quantity += item[:qty]
    end
    @basket = []
  end

  def confirm
    text = ConfirmationText.new(@customer)
    text.send
    return "Confirmation text sent to customer"
  end

  private
  def dish_not_available
    "Dish not currently available"
  end
end

# customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
# menu = Menu.new(Kernel)
# dish_1 = Dish.new("cake", 12, 5)
# dish_2 = Dish.new("Loaded fries", 6, 5)
# menu.add(dish_1)
# menu.add(dish_2)
# order = Order.new(customer, menu)
# order.add(dish_1, 2)
# order.add(dish_2, 1)
# order.confirm
