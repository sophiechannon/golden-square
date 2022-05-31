class Ship
  def initialize(length)
    @length = length
    @placed = false
    @orientation = nil
    @x_axis = nil
    @y_axis = nil
  end

  attr_accessor :placed, :orientation, :x_axis, :y_axis

  def length
    @length
  end

end