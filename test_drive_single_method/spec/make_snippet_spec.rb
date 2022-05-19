require "make_snippet"

RSpec.describe "make snippet method" do
  it "returns whole string if < 5 chars" do
    expect(make_snippet("hello")).to eq "hello"
  end

  it "returns whole first 5 words followed by ..." do
    expect(make_snippet("hello my name is sophie gilder")).to eq "hello my name is sophie..."
  end

  it "throws an error if string is empty" do
    expect { make_snippet(nil) }.to raise_error "That is not valid" 
  end
end