def get_most_common_letter(text)
  # added this line to remove non letter characters. Creates an array.
  text = text.chars.select {|char| ("A".."z").any?(char)}
  p text # check it has worked as planned
  counter = Hash.new(0)
  p "counter is empty #{counter}"
  text.each do |char| # deleted .chars as we have already turned it into an array on line 3
    counter[char] += 1
  end
  p counter.to_a.sort_by { |k, v| v } # it is sorting, but the reverse order to what we want
  p counter.to_a.sort_by { |k, v| v }.reverse # reversed the sorted string
  p counter.to_a.sort_by { |k, v| v }.reverse[0][0] # now it's showing " " as most common letter, which isn't a letter
  # I need to do something to the original text to just include letters
  # I added select method at top and now "o" is the most common letter
end

puts get_most_common_letter("the roof, the roof, the roof is on fire!")

# I have left my workings in 
# Clean code below

=begin

def get_most_common_letter(text)
  text = text.chars.select {|char| ("A".."z").any?(char)}
  counter = Hash.new(0)
  text.each do |char|
    counter[char] += 1
  end
  p counter.to_a.sort_by { |k, v| v }.reverse[0][0]
end

=end