#A method called count_words that takes a string as an argument and returns the number of words in that string.

require "count_words"

RSpec.describe "Count Words Method" do
  it "counts the number of words in the string" do
    expect(count_words("hi I'm Abhi")).to eq (3)
  end
  
end