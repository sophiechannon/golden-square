$LOAD_PATH << File.dirname(__FILE__)
require "order.rb"
require "dish.rb"
require "customer.rb"
require "menu.rb"
require "confirmation_text.rb"


class Receipt
  def initialize(terminal, order) # takes an order object
    @terminal = terminal
    @order = order
  end

  def itemised_bill_formatted
    print_receipt_header
    print_customer
    print_bill
    print_grand_total
  end

  def order
    @order
  end

  private

  def grand_total
    order.basket.map { |item| item[:dish].price * item[:qty] }.sum
  end

  def print_grand_total
    @terminal.puts "Grand total: £#{grand_total}"
  end

  def print_bill
    if order.basket.empty?
      @terminal.puts "Nothing ordered!"
    else
      order.basket.each do |item|
        @terminal.puts "#{item[:dish].name} (£#{item[:dish].price}) x #{item[:qty]}"
      end
    end
  end

  def print_customer
    @terminal.puts "Customer: #{order.customer.name}"
  end

  def print_receipt_header
    @terminal.puts "---Receipt---"
  end
end

# new_customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
# new_menu = Menu.new(Kernel)
# dish_1 = Dish.new("Burger", 12, 5)
# dish_2 = Dish.new("Loaded fries", 6, 5)
# new_menu.add(dish_1)
# new_menu.add(dish_2)
# new_order = Order.new(new_customer, new_menu)
# new_order.customer
# new_order.add(dish_1, 2)
# new_order.add(dish_2, 1)
# new_order.confirm
# receipt = Receipt.new(Kernel, new_order)
# receipt.itemised_bill_formatted