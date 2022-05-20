require "todo_list"
require "task"
require "diary"
require "diary_entry"

RSpec.describe "integration" do
  it "Diary adds and displays diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("21st Jan","What a nice day")
    entry_2= DiaryEntry.new("30th April", "Got a missed call from 07896758967")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.all).to eq [entry_1, entry_2]
  end

  it "Diary displays the contents of a specific diary entry" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("21st Jan","What a nice day")
    entry_2= DiaryEntry.new("30th April", "Got a missed call from 07896758967")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.read(entry_1)).to eq "What a nice day"
  end

  it "Diary recommends a suitable entry to read based on WPM and minutes available" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("21st Jan", "hello" * 400) # 2 minutes
    entry_2= DiaryEntry.new("30th April", "hi" * 300) # 2 minutes
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.recommend_entry(200, 2)).to eq "hello" * 400
  end

  it "recommended entry fails if WPM or minutes is 0" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("21st Jan", "hello" * 400) # 2 minutes
    entry_2= DiaryEntry.new("30th April", "hi" * 300) # 2 minutes
    diary.add(entry_1)
    diary.add(entry_2)
    expect{diary.recommend_entry(200, 0)}.to raise_error "can't be 0"
    expect{diary.recommend_entry(0, 4)}.to raise_error "can't be 0"
  end


  it "Diary displays a list of all UK mobile phone numbers in all diary entries" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("21st Jan","What a nice day. Got a call from 07854078924")
    entry_2= DiaryEntry.new("30th April", "Got a missed call from 07896758967")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.contacts).to eq ["07854078924", "07896758967"]
  end

  it "Todo list displays a list of outstanding tasks" do
    todo_list = TodoList.new
    task_1 = Task.new("Mop the floor")
    task_2= Task.new("wax the car")
    todo_list.add(task_1)
    todo_list.add(task_2)
    expect(todo_list.tasks).to eq [task_1, task_2]
  end

  it "Todo list displays a list of outstanding tasks after completion of a task" do
    todo_list = TodoList.new
    task_1 = Task.new("Mop the floor")
    task_2= Task.new("wax the car")
    todo_list.add(task_1)
    todo_list.add(task_2)
    task_1.mark_complete
    expect(todo_list.tasks).to eq [task_2]
  end
end