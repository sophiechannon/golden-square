require "diary"

RSpec.describe DiaryEntry do
  it "returns the title & contents" do
    diary_entry = DiaryEntry.new("Sophie's Diary", "My contents")
    expect(diary_entry.title).to eq "Sophie's Diary"
    expect(diary_entry.contents).to eq "My contents"
  end

  it "returns the wordcount of contents as int" do
    diary_entry = DiaryEntry.new("Sophie's Diary", "My contents")
    expect(diary_entry.count_words).to eq 2
  end

  context "when given a number greated than 0 as wpm" do
    it "tells you how long it will take to read in minutes, rounded up" do
      diary_entry = DiaryEntry.new("Sophie's Diary", "My contents")
      expect(diary_entry.reading_time(200)).to eq 1
    end
  end

  context "when given 0 as wpm" do
    it "fails" do
      # write a test for this
    end
  end

  it "Returns a string with a chunk of the contents that the user could read in the given number of minutes." do
    diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d e f g h i j k l m n o p q r s t u v w x y z")
    expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d e"
  end

  it "returns the next block of text if called twice" do
    diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d e f g h i j")
    expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d e"
    expect(diary_entry.reading_chunk(5, 1)).to eq "f g h i j"
  end

  context "reading_chunks loops back to the beginning" do
      it "works if word_count is divisible by wpm * minutes" do
        diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d e f g h i j")
        expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d e"
        expect(diary_entry.reading_chunk(5, 1)).to eq "f g h i j"
        expect(diary_entry.reading_chunk(5, 1)).to eq "a b c d e"
    end
    it "works if word_count is divisible by wpm * minutes" do
    end
  end

  # think about different examples i.e. text already fits within time
  # what if WPM is 0?


end