require "dish"
require "menu"
require "customer"
require "order"
require "receipt"

RSpec.describe "integration" do

  it "adds dishes to the menu and returns the list" do
    terminal = double :terminal
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 20)
    dish_2 = Dish.new("Loaded fries", 6, 50)
    dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect(menu.all).to eq [dish_1, dish_2, dish_3]
  end

  it "adds dishes to the menu and puts out in a nice format" do
    terminal = double :terminal
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 20)
    dish_2 = Dish.new("Loaded fries", 6, 50)
    dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect(terminal).to receive(:puts).with("---Menu---")
    expect(terminal).to receive(:puts).with("Ch*cken burger (£12)")
    expect(terminal).to receive(:puts).with("Loaded fries (£6)")
    expect(terminal).to receive(:puts).with("Chocolate m*lkshake (£4)")
    menu.view_all
  end

  it "doesn't puts dish to console if it is out of stock" do
    terminal = double :terminal
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 0)
    dish_2 = Dish.new("Loaded fries", 6, 50)
    dish_3 = Dish.new("Chocolate m*lkshake", 4, 80)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect(terminal).to receive(:puts).with("---Menu---")
    expect(terminal).to receive(:puts).with("Loaded fries (£6)")
    expect(terminal).to receive(:puts).with("Chocolate m*lkshake (£4)")
    menu.view_all
  end

  it "returns an error if all dishes are out of stock" do
    terminal = double :terminal
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 0)
    dish_2 = Dish.new("Loaded fries", 6, 0)
    dish_3 = Dish.new("Chocolate m*lkshake", 4, 0)
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    expect(terminal).to receive(:puts).with("Restaurant out of stock!")
    menu.view_all
  end

  it "adds an dish to the Order basket" do
    terminal = double :terminal
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
    expect(dish_1.quantity).to eq 3
    expect(dish_2.quantity).to eq 4
  end

  it "can't add item to Order basket if it's not added to the menu" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    dish_2 = Dish.new("Loaded fries", 6, 5)
    menu.add(dish_1)
    order = Order.new(customer, menu)
    expect { order.add(dish_2, 1) }.to raise_error "Dish not currently available"
  end

  it "can't add dish to Order basket if it's out of stock" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    dish_2 = Dish.new("Loaded fries", 6, 0) # out of stock
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(customer, menu)
    expect { order.add(dish_2, 2) }.to raise_error "Dish not currently available"
  end

  it "raises error if customer tries to add too many of an item" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    dish_2 = Dish.new("Loaded fries", 6, 5) # out of stock
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(customer, menu)
    expect { order.add(dish_2, 6) }.to raise_error "There are only 5 Loaded fries in stock"
  end

  it "Removes a quantity of dishes from the order basket" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    dish_2 = Dish.new("Loaded fries", 6, 5)
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(customer, menu)
    order.add(dish_1, 2)
    order.add(dish_2, 1)
    order.remove(dish_1, 1) # should still have one
    order.remove(dish_2, 1) # should dissapear completely
    expect(order.basket).to eq [{dish: dish_1, qty: 1}]
    expect(dish_1.quantity).to eq 4
    expect(dish_2.quantity).to eq 5
  end

  it "empties basket and resets quantities" do
    terminal = double :terminal
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
    expect(dish_1.quantity).to eq 5
    expect(dish_2.quantity).to eq 5
  end

  it "fails when removal is attempted on a dish that's not in the basket/basket is empty" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_2 = Dish.new("Loaded fries", 6, 5)
    menu.add(dish_2)
    order = Order.new(customer, menu)
    expect { order.remove(dish_2, 1) }.to raise_error "Item not in basket"
  end

  it "automatically removes item from order if quantity to removes is greater than quantity in basket" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    dish_2 = Dish.new("Loaded fries", 6, 5)
    menu.add(dish_1)
    menu.add(dish_2)
    order = Order.new(customer, menu)
    order.add(dish_1, 2)
    order.add(dish_2, 5)
    order.remove(dish_2, 6)
    expect(order.basket).to eq [{dish: dish_1, qty: 2}]
  end

  it "doesn't break if order is cancelled before anything is added" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    order = Order.new(customer, menu)
    order.cancel
    expect(order.basket).to eq []
  end

  it "Receipt takes order and putses it in a nice format" do
    terminal = double :terminal
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
    expect(terminal).to receive(:puts).with("---Receipt---")
    expect(terminal).to receive(:puts).with("Customer: Sophie")
    expect(terminal).to receive(:puts).with("Ch*cken burger (£12) x 2")
    expect(terminal).to receive(:puts).with("Loaded fries (£6) x 1")
    expect(terminal).to receive(:puts).with("Grand total: £30")
    receipt.itemised_bill_formatted
  end

  it "Receipt takes order and putses it in a nice format even if order is empty" do
    terminal = double :terminal
    customer = Customer.new("Sophie", "Waterbeach", "+447557942369")
    menu = Menu.new(terminal)
    order = Order.new(customer, menu)
    receipt = Receipt.new(terminal, order)
    expect(terminal).to receive(:puts).with("---Receipt---")
    expect(terminal).to receive(:puts).with("Customer: Sophie")
    expect(terminal).to receive(:puts).with("Nothing ordered!")
    expect(terminal).to receive(:puts).with("Grand total: £0")
    receipt.itemised_bill_formatted
  end


  # Possible edge cases...
  # Order is empty

end