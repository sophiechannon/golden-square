require "check_codeword"

RSpec.describe "check_codeword method" do
  it "returns correct message if codeword is correct" do
    expect(check_codeword("horse")).to eq "Correct! Come in."
  end

  it "returns close message if codeword begins with h" do
    expect(check_codeword("house")).to eq "Close, but nope."
  end

  it "returns NOPE message if codeword is incorrect and doesn't begin with h" do
    expect(check_codeword("show")).to eq "WRONG!"
  end
end
