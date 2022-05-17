require "string_builder"

RSpec.describe StringBuilder do
  it "adds a string and returns it" do
    string = StringBuilder.new
    string.add("yo")
    expect(string.output).to eq "yo"
  end

  it "returns an empty string if no string is added first" do
    string = StringBuilder.new
    expect(string.output).to eq ""
  end

  it "returns the length of a string" do
    string = StringBuilder.new
    string.add("yo")
    expect(string.size).to eq 2
  end

  it "returns the length of a string even if no string added" do
    string = StringBuilder.new
    expect(string.size).to eq 0
  end

end

