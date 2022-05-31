require "game"

RSpec.describe Game do
  it "constructs" do
    ship_1 = double :ship
    ship_2 = double :ship
    ship_3 = double :ship
    ship_4 = double :ship
    ship_5 = double :ship
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    expect(game.unplaced_ships).to eq [ship_1, ship_2, ship_3, ship_4, ship_5]
  end
end