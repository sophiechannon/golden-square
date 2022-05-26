$LOAD_PATH << File.dirname(__FILE__)
require "dish.rb"
require "customer.rb"
require "menu.rb"
require "confirmation_text.rb"
require "order.rb"

class Receipt
  def initialize(terminal, new_order) # takes an new_order object
    @terminal = terminal
    @new_order = new_order
  end

  def itemised_bill_formatted
    print_receipt_header
    print_customer
    print_bill
    print_grand_total
  end

  private

  def grand_total
    @new_order.basket.map { |item| item[:dish].price * item[:qty] }.sum
  end

  def print_grand_total
    @terminal.puts "Grand total: £#{grand_total}"
  end

  def print_bill
    if @new_order.basket.empty?
      @terminal.puts "Nothing ordered!"
    else
      @new_order.basket.each do |item|
        @terminal.puts "#{item[:dish].name} (£#{item[:dish].price}) x #{item[:qty]}"
      end
    end
  end

  def print_customer
    @terminal.puts "Customer: #{@new_order.customer.name}"
  end

  def print_receipt_header
    @terminal.puts "---Receipt---"
  end
end

# customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
# menu = Menu.new(Kernel)
# dish_1 = Dish.new("spoonr", 12, 5)
# dish_2 = Dish.new("Loaded fries", 6, 5)
# menu.add(dish_1)
# menu.add(dish_2)
# new_order = Order.new(customer, menu)
# new_order.add(dish_1, 2)
# new_order.add(dish_2, 1)
# new_order.confirm
# receipt = Receipt.new(Kernel, new_order)
# receipt.itemised_bill_formatted