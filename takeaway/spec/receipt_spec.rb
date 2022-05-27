require "receipt.rb"

RSpec.describe Receipt do
  it "constructs" do
    terminal = double :terminal
    order = double :order
    receipt = Receipt.new(terminal, order)
    expect(receipt.order).to eq order
  end

  it "prints a receipt" do
    dish_1 = double :dish, name: "Burger", price: 12
    customer = double :customer, name: "Sophie"
    order = double :order, basket: [{dish: dish_1, qty: 2}], customer: customer
    terminal = double :terminal
    receipt = Receipt.new(terminal, order)
    expect(terminal).to receive(:puts).with("---Receipt---")
    expect(terminal).to receive(:puts).with("Customer: Sophie")
    expect(terminal).to receive(:puts).with("Burger (£12) x 2")
    expect(terminal).to receive(:puts).with("Grand total: £24")
    receipt.itemised_bill_formatted
  end
end