class DiaryEntry
  def initialize(date, contents)
    @date = date # this will be a string
    @contents = contents
  end

  def contents
    @contents
  end

  def word_count
    @contents.split(" ").length
  end
end