require "rspec"

require_relative "list"
require_relative "task"

describe List do
  # Your specs here
  let(:description1) { "this is task1"}
  let(:task1) { Task.new(description1)}
  let(:description2) { "this is task2"}
  let(:task2) { Task.new(description2)}

  let(:title) { "Test List"}
  let(:tasks) { [task1, task2] }

  let(:list) { List.new(title, tasks)}

  describe "when initialize" do
    it "will create a list with tasks in the list" do
      mylist = List.new("Dor", [Task.new("haha"), Task.new("hehe")])
      # expect(List.new("Dor", [Task.new("haha"), Task.new("hehe") ])).to be_a_kind_of(List)
      expect(mylist).to be_a_kind_of(List)
      expect(mylist.title).to eql("Dor")
      expect(mylist.tasks.size).to eql(2)

    end

    it "requires two argument" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  describe "when add_task" do
    it "will add a new task inside the task array of the list" do
      list.add_task(Task.new("new task"))
      expect(list.tasks.size).to eql(3)
    end
  end

  describe "when complete_task" do
    it "will set the task at specified index to completed" do
      index = 1
      list.complete_task(index)
      expect(list.tasks[index].complete?).to be true
    end

  end

  describe "when complete_task with invalid index" do
    it "will output error msg" do
      index = 5
      expect(list.complete_task(index)).to eql("index invalid")
    end
  end


  describe "when delete_task" do
    it "will delete the task at specified index" do
      list.delete_task(0)
      expect(list.tasks.size).to eql(1)
    end
  end

  describe "when delete_task with invalid index" do
    it "will output error msg" do
      index = 5
      expect(list.delete_task(index)).to eql("index invalid")
    end
  end


  describe "when completed_tasks" do
    it "will show all the completed tasks" do
      list.complete_task(1)
      expect(list.completed_tasks.count).to eql(1)
    end
  end

  describe "when incomplete_tasks" do
    it "will show all the imcomplete tasks" do
      expect(list.incomplete_tasks.count).to eql(2)
    end
  end

end
