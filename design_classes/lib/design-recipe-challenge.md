# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class MusicTracker
  def initialize
    @list_of_tracks = []
  end

  def add_track(track)
    # adds track to #list of tracks
  end

  def display_list
    # disply array of tracks
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 add_track
tracks = MusicTracker.new
expect(tracks.add_track("Imagine")).to eq ["Imagine"]

# add a fail if string is empty
# error if already on list

# 2 display_list
tracks = MusicTracker.new
tracks.add_track("You Suffer")
tracks.add_track("Imagine")
expect(tracks.display_list).to eq ["You Suffer", "Imagine"]

# return "Playlist is empty" if #list_of_tracks is empty 

```


_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

