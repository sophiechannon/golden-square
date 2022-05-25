# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.



## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class Menu
  def initialize(terminal) # Initializes with kernal for putsing
    @terminal = terminal
    @dishes = []
  end

  def add(dish) # takes a dish object
  # adds dishes to the menu
  end

  def all
    return @dishes
  end

  def view_all
  # returns (or puts) the menu by category, formatted to show dish and price
  end

end

class Dish
  def initialize(name, price, quantity_available)
  end

  def name
  end

  def price
  end

  def quantity_available
  end
end

class Customer
  def initialize(name, address, phone_number)
  end

  def name
  end

  def address
  end

  def mobile_number
  end
end

class Order
  def initialize(customer, menu) # takes a Customer and Menu object
    @customer = customer
    @menu = menu
    @basket = []]
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

class Receipt
  def initialize(terminal, order) # takes an order object
  end

  def itemised_bill_formatted
    # iterates through each item in the order and putses it in a nice format
  end

  private

  def grand_total
    # workds out the grand total
  end

end

class ConfirmationText
  def initialize(requester, customer)
    @requester = requester # the proxy for the API call
    @customer = customer # Customer object
    @order = order # Order object
  end

  # there will be more methods here once I work out how to use Twilio
end

```

## 3. Integration test examples

_Make a list of examples of how the class will behave in different situations._

```ruby

# Dishes are added to the menu and returned 

menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 20)
dish_2 = Dish.new("Loaded fries", 6, 50)
dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(menu.all).to eq [dish_1, dish_2, dish_3]

# Dishes are added to the menu and are puts out in a nice format

menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 20)
dish_2 = Dish.new("Loaded fries", 6, 50)
dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(terminal).to receive(:puts)
.with("Ch*cken burger - £12\nLoaded frieds - £6\nChocolate m*lkshake - £4")
menu.view_all

# Edge cases...
# item doesn't puts to console if it is out of stock
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 0)
dish_2 = Dish.new("Loaded fries", 6, 50)
dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(terminal).to receive(:puts)
.with("Loaded frieds - £6\nChocolate m*lkshake - £4")
menu.view_all

# Menu is empty/all out of stock
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 0)
dish_2 = Dish.new("Loaded fries", 6, 0)
dish_3 = Dish.new("Chocolate m*lkshake", 4, 0)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(menu).to receive(:puts)
.with("Restaurant out of stock!")
menu.view_all

# Order adds an item to the basket
customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 5)
menu.add(dish_1)
menu.add(dish_2)
order = Order.new(customer, menu)
order.add(dish_1, 2)
order.add(dish_2, 1)
expect(order.basket).to eq [{dish: dish_1, qty: 2}, {dish: dish_2, qty: 1}]
expect (dish_1.quantity).to eq 3
expect (dish_2.quantity).to eq 4


# Order can't add item if it's not added to the menu

customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 5) # create item, but don't add it to menu
menu.add(dish_1)
order = Order.new(customer, menu)
expect { order.add(dish_2) }.to raise_error "Dish not currently available"

# Order can't add item if it's out of stock

customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 0) # out of stock
menu.add(dish_1)
menu.add(dish_2)
order = Order.new(customer, menu)
expect { order.add(dish_2, 2) }.to raise_error "Dish not currently available"

# Raises error if customer tries to add too many of an item

customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 5) # out of stock
menu.add(dish_1)
menu.add(dish_2)
order = Order.new(customer, menu)
expect { order.add(dish_2, 6) }.to raise_error "There are only 6 Loaded fries in stock"

# Item quanties can be removed from the Order basket

customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 5)
menu.add(dish_1)
menu.add(dish_2)
order = Order.new(customer, menu)
order.add(dish_1, 2)
order.add(dish_2, 1)
order.remove(dish_1, 1)
order.remove(dish_2, 1)
expect(order.basket).to eq [{dish: dish_1, qty: 1}]
expect (dish_1.quantity).to eq 4
expect (dish_2.quantity).to eq 5

# Basket can be emptied and all quantities reset

customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 5)
menu.add(dish_1)
menu.add(dish_2)
order = Order.new(customer, menu)
order.add(dish_1, 2)
order.add(dish_2, 1)
order.cancel
expect(order.basket).to eq []
expect (dish_1.quantity).to eq 5
expect (dish_2.quantity).to eq 5


# Possible edge cases...
# Item can't be removed because it's not in the basket
# basket is already empty and can't be emptied

# Receipt takes order and putses it in a nice format

dish_1 = Dish.new("Ch*cken burger", 12, 5)
dish_2 = Dish.new("Loaded fries", 6, 5)
customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
menu = Menu.new(terminal)
menu.add(dish_1)
menu.add(dish_2)
order = Order.new(customer, menu)
order.add(dish_1, 2)
order.add(dish_2, 1)
receipt = Receipt.new(terminal, order)
expect(terminal).to receive(:puts)
.with("Receipt\nCh*cken burger (£12) x 2\nLoaded frieds (£6) x 1")
expect(terminal).to receive(:puts)
.with("Grand total: £30")
receipt.itemised_bill_formatted

# Possible edge cases...
# Order is empty

```
## 4. unit test examples

```` ruby

# Dish constructs

dish_1 = Dish.new("Ch*cken burger", 12, 5)
expect(dish_1.name).to eq "Ch*cken burger"
expect(dish_2.price).to eq 12
expect(dish_2.quantity available).to eq 5

# Menu constructs

menu = Menu.new(terminal)
expect(menu.all).to eq []

# Menu viewer displays a message if no items added to menu

menu = Menu.new(terminal)
expect(menu).to receive(:puts)
.with("Restaurant out of stock!")
menu.view_all

# Customer constructs

customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
expect(customer.name).to eq "Sophie"
expect(customer.address).to eq "Waterbeach"
expect(customer.mobile_numer).to eq "+447557942369"

# Order constructs with doubles
customer = double: customer
menu = double: menu
order = Order.new(customer, order)
expect(order.basket).to eq {}

````

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

