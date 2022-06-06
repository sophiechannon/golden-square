require_relative "ship.rb"

class Game
  def initialize(rows, cols, ship_1, ship_2, ship_3, ship_4, ship_5)
    @rows = rows
    @cols = cols
    @all_ships = [ship_1, ship_2, ship_3, ship_4, ship_5]
  end

  attr_reader :rows, :cols

  def unplaced_ships
    @all_ships.select {|ship| ship.placed == false}
  end

  def place_ship(move)
    move = move
    unplaced_ships.each do |ship|
      if ship.length == move[:length] && ship.placed == false
        ship.placed = true
        ship.x_axis = move[:row]
        ship.y_axis = move[:col]
        ship.orientation = move[:orientation]
        occupy_spaces(ship)
        return
      end
    end
  end

  def ship_at?(x, y)
    # if @all_ships.any? do |ship|
    #   ship.x_axis == x &
  end

  private

  def occupy_spaces(ship)
    case ship.orientation
    when :vertical
      last_space = ship.y_axis + (ship.length)
      (ship.y_axis...last_space).each {|space| ship.spaces_occupied << [ship.x_axis, space]}
    when :horizontal
      last_space = ship.x_axis + ship.length
      (ship.x_axis...last_space).each {|space| ship.spaces_occupied << [ship.y_axis, space]}
    end
  end

end

# ship_1 = Ship.new(2)
# ship_2 = Ship.new(3)
# ship_3 = Ship.new(3)
# ship_4 = Ship.new(4)
# ship_5 = Ship.new(5)
# game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
# game.place_ship({length: 2, orientation: :vertical, row: 5, col: 5})
# binding.irb

