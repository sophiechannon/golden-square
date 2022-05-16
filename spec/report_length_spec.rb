require "report_length"

RSpec.describe "report_length method" do
  it "prints a sentence containing the length of the string passed to it" do
    expect(report_length("Sophie")).to eq "This string was 6 characters long."
  end

  it "works for strings with a mixture of values" do
    expect(report_length("123456789HeLlO   ///")).to eq "This string was 20 characters long."
  end

  it "will print the length of an array if passed an array" do
    expect(report_length(["Hi", "There"])).to eq "This string was 2 characters long."
  end

end