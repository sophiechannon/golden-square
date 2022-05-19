# grammar stats class has 3 methods
# initialize 
  # @passed = 0
  # @failed = 0
# check(text)
  # result = a booleon confirming if text passes tests
  # text = a block of text
# percentage_good
  # returns integer representing % of of tests passed
  # uses @passed and @failed to work this out

class GrammarStats
  def initialize
    @passed = 0
    @failed = 0
  end

  def check(text)
    fail "No text was provided!" if text == ""
    valid_punc = [".", "!", "?"]
    first_char = text[0] == text[0].upcase
    last_char = valid_punc.any?{|mark| mark == text[-1]}
    if first_char && last_char
      @passed += 1
    else
      @failed += 1
    end
    first_char && last_char
  end

  def percentage_good 
    total = @passed + @failed.to_f
    fail "No checks have been made yet!" if total == 0.0
    (@passed / total * 100).to_i
  end
end