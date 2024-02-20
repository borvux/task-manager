require "date"

# task class
class Task
  attr_accessor :task_name, :due_date, :priority

  # initialize name, date and priority of task
  # and it is readable and writeable
  def initialize(task_name, due_date, priority)
    @task_name = task_name
    @due_date = due_date
    @priority = priority
  end
end

# managing tasks class
class TaskManager
  # initialzie an array to store the tasks 
  def initialize
    @tasks = []
  end

  def view_tasks
    index = 1
    # display each tasks with an index
    @tasks.each do |task|
      puts "====Task #{index}===="
      puts "Name: #{task.task_name}"
      puts "Due Date: #{task.due_date}"
      puts "Priority: #{task.priority}"

      index += 1 # increment index 
    end
  end

  def add_task
    # ask user for inputs 
    print "Enter task name: " # using print to not get the new line of puts
    task_name = gets.chomp
    print "Enter due date (YYYYMMDD): "
    due_date = gets.chomp
    due_date_formatted = Date.parse(due_date) # formate the date
    print "Enter priority (high, medium, low): "
    priority = gets.chomp

    # create a new task class with the user inputs 
    task = Task.new(task_name, due_date_formatted, priority)
    @tasks.push(task) # put the new task into the array
  end

  def delete_task

  end

end
