require "diary_entry"

RSpec.describe DiaryEntry do
  it "returns title and contets as a string" do
    entry_1 = DiaryEntry.new("first entry", "today was nice")
    expect(entry_1.title).to eq "first entry"
    expect(entry_1.contents).to eq "today was nice"
  end

  context "#reading_chunks prints correct chunk" do
    it "loops back to beginning" do
      diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d e f g h i j k l m n o p")
      expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d e"
      expect(diary_entry.reading_chunk(5, 1)).to eq "f g h i j"
      expect(diary_entry.reading_chunk(5, 1)).to eq "k l m n o"
      expect(diary_entry.reading_chunk(5, 1)).to eq "p"
      expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d e"
    end
 
    it "still works even if count is less than five" do
      diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d")
      expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d"
      expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d"
    end
  end
end