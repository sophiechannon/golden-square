require "secret_diary"

RSpec.describe SecretDiary do
  it "returns the contents of the diary if unlocked" do
    diary = double :diary, read: "What a lovely day"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "What a lovely day"
  end

  it "returns Go Away if diary is locked" do
    diary = double :diary, read: "What a lovely day"
    secret_diary = SecretDiary.new(diary)
    expect(secret_diary.read).to eq "GO AWAY!"
  end

  it "returns Go Away if diary is unlocked a re-locked" do
    diary = double :diary, read: "What a lovely day"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect(secret_diary.read).to eq "GO AWAY!"
  end
end