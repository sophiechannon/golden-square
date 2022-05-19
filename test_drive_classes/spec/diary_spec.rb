require "diary"

RSpec.describe DiaryEntry do
  it "returns the title" do # title is not used elsewhere in this class
    diary_entry = DiaryEntry.new("Sophie's Diary", "My contents")
    expect(diary_entry.title).to eq "Sophie's Diary"
  end

  it "raises error if content or title is empty " do
    diary_entry = DiaryEntry.new("", "")
    expect{diary_entry.title}.to raise_error "Enter Title"
    expect{diary_entry.contents}.to raise_error "Enter Content"
  end

  context "when wpm or minutes is 0" do
    it "fails" do
      diary_entry = DiaryEntry.new("Sophie's Diary", "My contents")
      expect {diary_entry.reading_time(0)}.to raise_error "Enter a bigger number" 
      expect {diary_entry.reading_chunk(0, 5)}.to raise_error "Enter a bigger number" 
      expect {diary_entry.reading_chunk(5, 0)}.to raise_error "Enter a bigger number" 
    end
  end

  context "when reading_time is given a number greated than 0 as wpm" do
    it "tells you how long it will take to read in minutes, rounded up" do
      diary_entry = DiaryEntry.new("Sophie's Diary", "My contents")
      expect(diary_entry.reading_time(200)).to eq 1
    end
  end

  context "reading_chunks prints correct chunk" do
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