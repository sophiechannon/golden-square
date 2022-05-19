def todo_checker(text)
  #if #TODO is present then return true
  #else return false
  if text.include? "#TODO"
    return true
  else 
    return false
  end
end