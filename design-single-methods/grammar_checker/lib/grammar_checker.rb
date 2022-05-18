def grammar_checker(text)
  fail "No text was provided" if text == ""

  valid_punc = [".", "!", "?"]

  first_char = (text[0] == text[0].upcase)
  last_char = valid_punc.any?{|ender| ender == text[-1]}

  "starting letter: #{first_char}, \npunctuation: #{last_char}"
end