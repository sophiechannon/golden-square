class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @words_read = 0
  end

  def title
    fail "Enter Title" if @title == ""
    @title
  end

  def contents
    fail "Enter Content" if @contents == ""
      @contents
  end

  def count_words
    words.length
  end

  def reading_time(wpm)
    fail "Enter a bigger number" if wpm == 0
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    fail "Enter a bigger number" if wpm == 0 || minutes == 0
    amount_we_can_read = wpm * minutes
    start_at = @words_read
    words_to_show = words[start_at, amount_we_can_read]
    if count_words == @words_read + words_to_show.length
      @words_read = 0
    else
      @words_read = @words_read + amount_we_can_read
    end 
    words_to_show.join(" ")
  end
  
  private

  def words
    @contents.split(" ")
  end

end


# diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d e f g h i j k l m n o p")
# p diary_entry.reading_chunk(5, 1)
# p diary_entry.reading_chunk(5, 1)
# p diary_entry.reading_chunk(5, 1)
# p diary_entry.reading_chunk(5, 1)
# p diary_entry.reading_chunk(5, 1)