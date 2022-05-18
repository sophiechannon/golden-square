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
      fail "Enter Content"
      @contents
  end

  def count_words
    @contents.split(" ").length
  end


  def reading_time(wpm)
    fail "Enter a bigger number" if wpm == 0
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    amount_we_can_read = wpm * minutes
    start_at = @words_read
    end_at = @words_read + amount_we_can_read
    words_to_show = @contents.split(" ")[start_at...end_at]
    if words.length == @words_read + words_to_show.length
      @words_read = 0
    else
      @words_read = amount_we_can_read
    end 
    words_to_show.join(" ")
  end
  
  private

  def words
    @contents.split(" ")
  end

end


# diary_entry = DiaryEntry.new("Sophie's Diary", "a b c d e f g h ")
# diary_entry.reading_chunk(5, 1)
# diary_entry.reading_chunk(5, 1)
# diary_entry.reading_chunk(5, 1)