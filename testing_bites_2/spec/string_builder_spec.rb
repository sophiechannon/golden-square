require "string_builder"

RSpec.describe StringBuilder do
  context "given a string" do
    it "adds a string and returns it" do
      string = StringBuilder.new
      string.add("yo")
      expect(string.output).to eq "yo"
    end
    it "returns the length of a string" do
      string = StringBuilder.new
      string.add("yo")
      expect(string.size).to eq 2
    end
  end

  context "not given a string" do
    it "returns an empty string" do
      string = StringBuilder.new
      expect(string.output).to eq ""
    end
    it "returns 0 for length" do
      string = StringBuilder.new
      expect(string.size).to eq 0
    end
  end

end

