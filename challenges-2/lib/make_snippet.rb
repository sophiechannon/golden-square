def make_snippet(text)
  fail "That is not valid" if text == nil
  array = text.split(" ")
  if array.length <= 5
    return array.join(" ")
  else
    return "#{array.first(5).join(" ")}..."
  end
end