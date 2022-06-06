class Ship
  def initialize(length)
    @length = length
    @placed = false
    @orientation = nil
    @x_axis = nil
    @y_axis = nil
    @spaces_occupied = []
  end

  attr_accessor :placed, :orientation, :x_axis, :y_axis, :spaces_occupied
  attr_reader :length

end