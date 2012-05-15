require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  
  test "A blank task can be added" do 
    @one = TodoList.new
    assert @one.save, "Failed to add a blank task"
  end
  
  test "A task with only a description can be added" do
    @one = TodoList.create! :description => "Do stuff"
    assert @one.save, "Failed to add a task with only a description"
  end
  
  test "A task with only a date can be added" do
    @one = TodoList.create! :date => Date.today
    assert @one.save, "Failed to add a task with only a date"
  end
  
  test "A full task can be added" do
    @one = TodoList.create! :date => Date.today, :description => "Do something"
    assert @one.save, "Failed to save a full task object"
  end
end
