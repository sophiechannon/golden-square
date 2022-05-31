require "ship"

RSpec.describe Ship do
  it "constructs" do
    ship = Ship.new(2)
    expect(ship.length).to eq 2
  end
end