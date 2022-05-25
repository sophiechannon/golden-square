require "dish"

RSpec.describe Dish do
  it "constructs" do
    dish_1 = Dish.new("Ch*cken burger", 12, 5)
    expect(dish_1.name).to eq "Ch*cken burger"
    expect(dish_1.price).to eq 12
    expect(dish_1.quantity).to eq 5
  end
end