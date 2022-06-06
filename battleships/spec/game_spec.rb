require "game"

RSpec.describe Game do
  it "constructs" do
    ship_1 = double :ship, placed: false
    ship_2 = double :ship, placed: false
    ship_3 = double :ship, placed: false
    ship_4 = double :ship, placed: false
    ship_5 = double :ship, placed: false
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    expect(game.unplaced_ships).to eq [ship_1, ship_2, ship_3, ship_4, ship_5]
  end

  it "only shows unplaced ships" do
    ship_1 = double :ship, placed: true
    ship_2 = double :ship, placed: false
    ship_3 = double :ship, placed: false
    ship_4 = double :ship, placed: false
    ship_5 = double :ship, placed: false
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    expect(game.unplaced_ships).to eq [ship_2, ship_3, ship_4, ship_5]
  end

  it "returns true if a ship is at the coordinates" do
    ship_1 = double :ship, placed: true, x_axis: 2, y_axis: 5
    ship_2 = double :ship, placed: false
    ship_3 = double :ship, placed: false
    ship_4 = double :ship, placed: false
    ship_5 = double :ship, placed: false
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    expect(game).to receive(:ship_at?).with(2, 5).and_return false
    game.ship_at?(2, 5)
  end

end