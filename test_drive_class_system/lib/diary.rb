class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    all.map { |entry| entry.count_words } .sum
  end

  def reading_time(wpm)
    all.map { |entry| entry.reading_time(wpm) }.sum
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    possible = []
    all.each do |entry|
      next if entry.reading_time(wpm) > minutes
      possible << entry.contents
    end
    possible.sort_by{|x| x.length}[-1]
  end

end