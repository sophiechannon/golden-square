class Diary
  def initialize(contents) # contents is a string
    @contents = contents
  end

  def read
    fail "Enter some contents" if @contents == ""
    return @contents
  end
end