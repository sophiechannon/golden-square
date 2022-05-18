def estimate_reading_time(text)
  if text == ""
    fail "No text was provided"
  end

  time = (text.split(" ").length).to_f / 200 
  if time < 1
    return "About #{time.ceil} minute" 
  else
    return "About #{time.ceil} minutes"
  end
end