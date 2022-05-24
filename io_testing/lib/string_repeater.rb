# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX

class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will repeat a string many times.\nPlease enter a string"
    string = @terminal.gets.chomp
    @terminal.puts "Please enter a number of repeats"
    number = @terminal.gets.chomp.to_i
    @terminal.puts "Here is your result:"
    @terminal.puts string * number
  end

end