require "grammar_checker"

RSpec.describe "grammar checker method" do
  it "returns false for string with incorrect capitalization and punctuation" do
    expect(grammar_checker("hello, my name Sophie")).to eq "starting letter: false, \npunctuation: false"
  end

  it "returns true  for string with correct capitalization and punctuation" do
    expect(grammar_checker("Hello, my name Sophie!")).to eq "starting letter: true, \npunctuation: true"
  end

  it "throws error if string empty" do
    expect{ grammar_checker("") }.to raise_error "No text was provided"
  end
end