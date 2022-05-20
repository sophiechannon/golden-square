require "diary"
require "diary_spec"

RSpec.describe "integration" do
  context "entries have been added" do
    it "adds a diary entry to the diary array" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("first entry", "today was nice")
      entry_2 = DiaryEntry.new("second entry", "today sucked!")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end

    it "returns total word count of all entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("first entry", "today was nice")
      entry_2 = DiaryEntry.new("second entry", "today sucked!")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 5
    end

    it "returns amount of time it would take to read all entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("first entry", "today was nice" * 100)
      entry_2 = DiaryEntry.new("second entry", "today sucked!")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(200)).to eq 3
    end

    it "raises an error if wpm is 0" do # add this functionality to the DiaryEntry class
      diary = Diary.new
      entry_1 = DiaryEntry.new("first entry", "today was nice" * 100)
      diary.add(entry_1)
      expect { diary.reading_time(0) }.to raise_error "Reading time can't be 0"
    end

    it "returns the best diary entry to read, even if some entries have same reading time" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("first entry", "today was nice" * 100) # 300 words
      entry_2 = DiaryEntry.new("second entry", "today sucked!" * 200) # 400 words
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(200, 3)). to eq entry_2.contents
    end

    it "#best_entry_for_reading_time raises error if wpm is 0" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("first entry", "today was nice" * 100) # 300 words
      diary.add(entry_1)
      expect{diary.find_best_entry_for_reading_time(0, 3)}.to raise_error "Reading time can't be 0"
    end
  end

  context "no entries added" do
    it "word count returns 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end
  end

end
