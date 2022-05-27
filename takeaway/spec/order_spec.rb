require "order"

RSpec.describe Order do
  context "initially" do
    it "is empty" do
      customer = double :customer
      menu = double :menu
      text = double :text
      order = Order.new(customer, order, text)
      expect(order.basket).to eq []
    end
  end

  it "confirms order and sends text" do
    customer = double :customer
    menu = double :menu
    text = double :text, send: nil
    order = Order.new(customer, order, text)
    expect(order.confirm).to eq "Confirmation text sent to customer"
  end
end