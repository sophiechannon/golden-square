class Game
  def initialize(rows, cols, ship_1, ship_2, ship_3, ship_4, ship_5)
    @rows = rows
    @cols = cols
    @ship_1 = ship_1
    @ship_2 = ship_2
    @ship_3 = ship_3
    @ship_4 = ship_4
    @ship_5 = ship_5
  end

  def unplaced_ships
    [@ship_1, @ship_2, @ship_3, @ship_4, @ship_5]
  end

  def rows
    @rows
  end

  def cols
    @cols
  end

  def place_ship(move)
    # length: ship_length.to_i,
    # # selects the ship of your choice (removes it from the unplaced ships array)
    # orientation: {"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),
    # # this will return the value of v or h depending on what the user inputs
    # row: ship_row.to_i,
    # # stores x asis
    # col: ship_col.to_i
    # # stores y axis
  )
  end

  def ship_at?(x, y)
    # returns booleon
  end
end
