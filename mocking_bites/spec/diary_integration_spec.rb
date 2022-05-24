require "diary"
require "secret_diary"

RSpec.describe "integration" do
  it "returns the contents of the diary if unlocked" do
    diary = Diary.new("What a lovely day")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "What a lovely day"
  end

  it "returns Go Away if diary is locked" do
    diary = Diary.new("What a lovely day")
    secret_diary = SecretDiary.new(diary)
    expect(secret_diary.read).to eq "GO AWAY!"
  end

  it "fails if diary contents is empty" do
    diary = Diary.new("")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect {secret_diary.read}.to raise_error "Enter some contents"
  end
end