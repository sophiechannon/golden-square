$LOAD_PATH << "lib"
require "game"
require "user_interface"
require "ship"

class TerminalIO
  def gets
    return Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end

io = TerminalIO.new
ship_1 = Ship.new(2)
ship_2 = Ship.new(3) 
ship_3 = Ship.new(3)
ship_4 = Ship.new(4)
ship_5 = Ship.new(5)
game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
user_interface = UserInterface.new(io, game)
user_interface.run
