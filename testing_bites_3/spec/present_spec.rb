require "present"

RSpec.describe Present do
  it "returns the contents" do
    present = Present.new
    expect(present.wrap(["doll", "socks", "chocolate"])).to eq ["doll", "socks", "chocolate"]
  end

  it "throws an error if you try to unwrap before wrapping" do
    present = Present.new
    expect{ present.unwrap }.to raise_error "No contents have been wrapped."
  end

  it "throws an error if you try to wrap when present is already wrapped" do
    present = Present.new
    present.wrap(["doll", "socks", "chocolate"])
    expect{ present.wrap(["puppy", "coal"]) }.to raise_error "Contents has already been wrapped."
  end

end