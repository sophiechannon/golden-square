require "receipt.rb"

RSpec.describe Receipt do
  it "constructs" do
    order = double :order
    terminal = double :terminal
    receipt = Receipt.new(terminal, order)
    expect(receipt.order).to eq order
  end
end