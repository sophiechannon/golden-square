require "check_codeword"

RSpec.describe "check_codeword method" do
  it "returns correct message if codeword is correct" do
    expect(check_codeword("horse")).to eq "Correct! Come in."
  end

  it "returns close message if codeword begins with h and ends with e" do
    expect(check_codeword("house")).to eq "Close, but nope."
  end

  it "returns NOPE message if codeword is incorrect and doesn't meet criterior for close" do
    expect(check_codeword("show")).to eq "WRONG!"
  end

  it "returns NOPE message if one element of close is met, but not both" do
    expect(check_codeword("hippo")).to eq "WRONG!"
    expect(check_codeword("sophie")).to eq "WRONG!"
  end
end
