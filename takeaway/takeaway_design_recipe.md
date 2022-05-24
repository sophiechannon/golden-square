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
  def initialize(io) # Initializes with kernal for putsing
    @io = io
    @dishes = []
  end

  def add(dish) # takes a dish object
  # adds dishes to the menu
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
  def initialize(customer) # takes a customer object
    @customer = customer
    @basket = []
  end

  def add(dish) # takes a dish object
    # adds to the dishes array
  end

  def all
    # returns the order @basket
  end

  def remove_item
    #removes an item from the @basket
  end

  def cancel_order
    #empties basket
  end
end

class Receipt
  def initialize(order) # takes an order object
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

# Dishes are added to the menu and are puts out in a nice format

menu = Menu.new(io)
dish_1 = Dish.new("Ch*cken burger", 12, 20)
dish_2 = Dish.new("Loaded fries", 6, 50)
dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
expect(io).to receive(:puts)
.with("Ch*cken burger - £12\nLoaded frieds - £6\nChocolate m*lkshake - £4")
menu.all

# item doesn't show if it is out of stock



```
## 4. unit test examples

```` ruby



````

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

