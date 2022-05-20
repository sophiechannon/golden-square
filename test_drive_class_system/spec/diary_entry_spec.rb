require "diary_entry"

RSpec.describe DiaryEntry do
  it "contructs" do
    entry = DiaryEntry.new("first entry", "today was nice")
  end

  it "returns title and contets as a string" do
    entry_1 = DiaryEntry.new("first entry", "today was nice")
    expect(entry_1.title).to eq "first entry"
    expect(entry_1.contents).to eq "today was nice"
  end

  it "counts words of entry" do
    entry_1 = DiaryEntry.new("first entry", "today was nice")
    expect(entry_1.count_words).to eq 3
  end

  it "returns reading time rounded up to minute" do
    entry_1 = DiaryEntry.new("first entry", "today was nice" * 100)
    expect(entry_1.reading_time(200)).to eq 2
  end


end