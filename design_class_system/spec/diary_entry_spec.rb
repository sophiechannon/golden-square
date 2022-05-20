require "diary_entry"

RSpec.describe DiaryEntry do
  it "returns the contents" do
    entry = DiaryEntry.new("21st Jan","What a nice day")
    expect(entry.contents).to eq "What a nice day"
  end

  it "returns the word count of contents" do
    entry = DiaryEntry.new("21st Jan", "What a nice day")
    expect(entry.word_count).to eq 4
  end
end