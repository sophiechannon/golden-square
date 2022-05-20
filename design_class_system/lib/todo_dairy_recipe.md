# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

Diary class
- add
- recommended diary entry
- contacts

DiaryEntries >> feed into the Diary
- entry

TodoList
- add

Task >> feeds into the TodoList
- add
- task
- mark_complete

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class Diary
  def initialize
    @entries = []
  end

  def add(entry) # DiaryEntry
    # add an entry to the entries list
  end

  def read(entry)
    # returns the contents of that entry
  end

  def all
    # displays a list of all entries as an array
  end

  def recommend_entry(wpm, minutes)
    # return the most suitable diary entry for the reading speed and available minutes
    # cannot be longer than the number of minutes
  end

  def contacts
    # return an array of all mobile phone numbers in all diary entries
  end
end

class DiaryEntry
  def initialize(date, contents)
    @date = date # this will be a string
    @contents = contents
  end

  def contents
    @contents
  end

  def word_count
    # no. words in contents
  end
end

class TodoList
  def initialize
    @tasks = []
  end

  def add(task)
    # adds tasks to list
  end

  def tasks
    # displays taks that are outstanding
  end
end

class Task
  def initialize(task)
    @task = task
    @is_complete = false
  end

  def name
    # displays the name of the task
  end

  def mark_complete
    # changes the status of the task to complete
  end
end


```

## 3. Integration test examples

_Make a list of examples of how the class will behave in different situations._

```ruby

# check that an instance of DiaryEntry is added to Diary

diary = Diary.new
entry_1 = DiaryEntry.new("21st Jan","What a nice day")
entry_2= DiaryEntry.new("30th April", "Got a missed call from 07896758967")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.all).to eq [entry_1, entry_2]

# we can read the contents of a specific diary entry

diary = Diary.new
entry_1 = DiaryEntry.new("21st Jan","What a nice day")
entry_2= DiaryEntry.new("30th April", "Got a missed call from 07896758967")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.read(entry_1)).to eq "What a nice day"

# recommends a suitable entry to read based on WPM and minutes available

diary = Diary.new
entry_1 = DiaryEntry.new("21st Jan", "hello" * 400) # 2 minutes
entry_2= DiaryEntry.new("30th April", "hi" * 300) # 2 minutes
diary.add(entry_1)
diary.add(entry_2)
expect(diary.recommend_entry(200, 2).to eq "hello" * 400

# displays a list of all UK mobile phone numbers in all diary entries

diary = Diary.new
entry_1 = DiaryEntry.new("21st Jan","What a nice day. Got a call from 07854078924")
entry_2= DiaryEntry.new("30th April", "Got a missed call from 07896758967")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.contacts).to eq ["07854078924", "07896758967"]

# Todo list displays a list of outstanding tasks

todo_list = TodoList.new
task_1 = Task.new("Mop the floor")
task_2= Task.new("wax the car")
todo_list.add(task_1)
todo_list.add(task2)
expect(diary.tasks).to eq [task_1, task_2]

# Todo list displays a list of outstanding tasks after completion of a task

todo_list = TodoList.new
task_1 = Task.new("Mop the floor")
task_2= Task.new("wax the car")
todo_list.add(task_1)
todo_list.add(task2)
task_1.mark_complete
expect(diary.tasks).to eq [task_2]


```
## 4. unit test examples

```` ruby

# Diary

diary = Diary.new
expect(diary.all).to eq []

# DiaryEntry

entry = DiaryEntry.new("21st Jan","What a nice day")
expect(entry.contents).to eq "What a nice day"

# Todo List

list = TodoList.new
expect(list.tasks).to eq []

# Task

task = Task.new("mop the floor")
expect(task.name).to eq "mop the floor"



````

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

