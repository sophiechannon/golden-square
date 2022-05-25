require "order"

RSpec.describe Order do
  context "initially" do
    it "is empty" do
      customer = double :customer
      menu = double :menu
      order = Order.new(customer, order)
      expect(order.basket).to eq []
    end
  end
end