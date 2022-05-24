require "string_repeater"

RSpec.describe StringRepeater do
  it "repeats a string x many times depending on user input" do
    terminal = double :terminal
    string_repeater = StringRepeater.new(terminal)
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.\nPlease enter a string")
    expect(terminal).to receive(:gets).and_return("TWIX")
    expect(terminal).to receive(:puts).with("Please enter a number of repeats")
    expect(terminal).to receive(:gets).and_return("10")
    expect(terminal).to receive(:puts).with("Here is your result:")
    expect(terminal).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")
    string_repeater.run
  end

end