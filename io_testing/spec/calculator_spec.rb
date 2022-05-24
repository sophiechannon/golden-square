require "calculator"

RSpec.describe InteractiveCalculator do
  it "uses user input to get 2 numbers and prints out the result of the subtraction" do
    terminal = double :terminal
    interactive_calculator = InteractiveCalculator.new(terminal)
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.\nPlease enter a number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("3").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("4 - 3 = 1").ordered
    interactive_calculator.run
  end
end
