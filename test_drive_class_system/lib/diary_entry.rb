class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @words_read = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm)
    fail "Reading time can't be 0" if wpm == 0
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