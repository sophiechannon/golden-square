require "diary"

RSpec.describe Diary do
  it "contructs and returns contents" do
    diary = Diary.new("What a lovely day")
    expect(diary.read).to eq "What a lovely day"
  end

  it "raises and error if contents string is empty" do
    diary = Diary.new("")
    expect { diary.read }.to raise_error "Enter some contents"
  end
end