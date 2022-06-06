require "game"
require "ship"
require "user_interface"

describe "integration" do
  it "updates ships details when #Game.place_ship is called" do
    ship_1 = Ship.new(2)
    ship_2 = Ship.new(3)
    ship_3 = Ship.new(3)
    ship_4 = Ship.new(4)
    ship_5 = Ship.new(5)
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    game.place_ship({length: 2, orientation: :vertical, row: 5, col: 2})
    expect(ship_1.placed).to eq true
    expect(ship_2.placed).to eq false
    expect(ship_1.orientation).to eq :vertical
  end

  it "removes ship from unused ships when placed" do
    ship_1 = Ship.new(2)
    ship_2 = Ship.new(3)
    ship_3 = Ship.new(3)
    ship_4 = Ship.new(4)
    ship_5 = Ship.new(5)
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    game.place_ship({length: 2, orientation: :vertical, row: 5, col: 2})
    expect(ship_1.placed).to eq true
    expect(game.unplaced_ships).to eq [ship_2, ship_3, ship_4, ship_5]
  end

  context "ships of the same size" do
    it "updates ships details when #Game.place_ship is called" do
      ship_1 = Ship.new(2)
      ship_2 = Ship.new(3)
      ship_3 = Ship.new(3)
      ship_4 = Ship.new(4)
      ship_5 = Ship.new(5)
      game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
      game.place_ship({length: 3, orientation: :vertical, row: 5, col: 2})
      expect(ship_2.placed).to eq true
      expect(ship_3.placed).to eq false
      expect(ship_2.orientation).to eq :vertical
      expect(ship_3.orientation).to eq nil
    end
  end

  xit "creates an array of occupied spaces when ship_placed is called" do
    game = double(:game, rows: 10, cols: 10)
    ship_1 = Ship.new(2)
    expect(game).to receive(:place_ship).with({length: 2, orientation: :vertical, row: 5, col: 2})
    game.place_ship(({length: 2, orientation: :vertical, row: 5, col: 2}))
    expect(ship_1).to receive(:spaces_occupied).and_return([[2, 5], [2, 6]])
    ship_1.spaces_occupied
  end
end