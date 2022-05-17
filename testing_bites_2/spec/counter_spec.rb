require "counter"

RSpec.describe Counter do
  it "adds a given number to the counter" do
    counter = Counter.new
    counter.add(9)
    expect(counter.report).to eq "Counted to 9 so far."
  end

  it "works for large numbers" do
    counter = Counter.new
    counter.add(123456789)
    expect(counter.report).to eq "Counted to 123456789 so far."
  end

  it "works for floats" do
    counter = Counter.new
    counter.add(1.234)
    expect(counter.report).to eq "Counted to 1.234 so far."
  end
end