require "ship"

RSpec.describe Ship do
  it "constructs" do
    ship = Ship.new(2)
    expect(ship.length).to eq 2
  end

  it "updates ships details when #Game.place_ship is called" do
    game = double(:game, rows: 10, cols: 10)
    ship_1 = Ship.new(2)
    ship_2 = Ship.new(3)
    allow(game).to receive(:unplaced_ships).and_return([ship_1, ship_2])
    expect(game).to receive(:place_ship).with({length: 2, orientation: :vertical, row: 5, col: 2})
    game.place_ship(({length: 2, orientation: :vertical, row: 5, col: 2}))
    expect(ship_1).to receive(:placed).and_return(true)
    expect(ship_2).to receive(:placed).and_return(false)
    expect(ship_1).to receive(:x_axis).and_return(5)
    expect(ship_1).to receive(:y_axis).and_return(2)
    expect(ship_1).to receive(:orientation).and_return(:vertical)
    ship_1.placed
    ship_2.placed
    ship_1.x_axis
    ship_1.y_axis
    ship_1.orientation
  end

  it "creates an array of occupied spaced when placed" do
    game = double(:game, rows: 10, cols: 10)
    ship_1 = Ship.new(2)
    expect(game).to receive(:place_ship).with({length: 2, orientation: :vertical, row: 5, col: 2})
    game.place_ship(({length: 2, orientation: :vertical, row: 5, col: 2}))
    expect(ship_1).to receive(:spaces_occupied).and_return([[2, 5], [2, 6]])
    ship_1.spaces_occupied
  end

end