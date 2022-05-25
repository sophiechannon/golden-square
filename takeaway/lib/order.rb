require "dish.rb"
require "customer.rb"
require "menu.rb"

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

  private
  def dish_not_available
    "Dish not currently available"
  end

end