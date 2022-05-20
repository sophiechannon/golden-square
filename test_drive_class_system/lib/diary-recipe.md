# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep store and review my diary entries
I want to add my diary entries and see them
I also want to know how long they take to read and get recommendations on which ones to read based on my available time

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class Diary
  def initialize
  @entries = [] #array of all diary entries submitted
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end


class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end


```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 add DiaryEntry to Diary
diary = Diary.new
entry_1 = DiaryEntry("first entry", "today was nice")
entry_2 = DiaryEntry("second entry", "today sucked!")
diary.add(diary_1)
diary.add(diary_2)
diary.all => [entry_1, entry_2]

#2 returns total word count of all entries
diary = Diary.new
entry_1 = DiaryEntry("first entry", "today was nice")
entry_2 = DiaryEntry("second entry", "today sucked!")
diary.add(diary_1)
diary.add(diary_2)
diary.count_words => 5

# returns 0 if no entries added

# 3 returns amount of time it would take to read all entries

diary = Diary.new
entry_1 = DiaryEntry("first entry", "today was nice" * 200)
entry_2 = DiaryEntry("second entry", "today sucked!")
diary.add(diary_1)
diary.add(diary_2)
diary.reading_time(200) => 2

# error if reading time is 0 
# return 0 if no entries added

# 4 returns the entry with reading time closest to value entered - but not over

diary = Diary.new
entry_1 = DiaryEntry("first entry", "today was nice" * 200)
entry_2 = DiaryEntry("second entry", "today sucked!" * 500)
diary.add(diary_1)
diary.add(diary_2)
diary.find_best_entry_for_reading_time(200, 3) => [entry_2.contents]

diary = Diary.new
entry_1 = DiaryEntry("first entry", "today was nice" * 600)
entry_2 = DiaryEntry("second entry", "today sucked!" * 500)
diary.add(diary_1)
diary.add(diary_2)
diary.find_best_entry_for_reading_time(200, 2) => "There isn't enough time to read any of your entries"

# return 0 if no entries added

```


_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

