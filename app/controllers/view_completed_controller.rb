class ViewCompletedController < ApplicationController
  def index
    @todo_lists = TodoList.all
    @odd_element = true
  end
  
  def add_to_completed
    @ids = params[':tasks']
    
    if not @ids.nil?
      @ids.each do |id|
        TodoList.find(id).update_attributes(:completed => true)
      end
      redirect_to todo_lists_path, :notice => "Task(s) Were Added To Completed"
    else
      redirect_to todo_lists_path, :alert => "No Tasks Were Selected"
    end
  end
end
