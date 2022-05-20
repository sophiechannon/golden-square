class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def read(entry)
    fail "no such entry" if !all.include?(entry)
    selected = []
    all.each do |option|
      selected << entry if option == entry
    end
    selected.map { |option| option.contents}.join("")
  end

  def all
    @entries
  end

  def recommend_entry(wpm, minutes)
    fail "can't be 0" if wpm == 0 || minutes == 0
    poss = []
    all.each do |entry|
      next if entry.word_count > wpm * minutes
      poss << entry.contents
    end

    poss.sort_by {|x| x.length}[-1]
  end

  def contacts
    array = []
    all.each do |entry|
      array << entry.contents if entry.contents.include?("07")
    end
    array.map! do |entry|
      entry.delete("^0123456789")
    end
    array
  end

end