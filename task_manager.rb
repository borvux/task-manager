require "date"

# task class
class Task
  # to be able to settable and gettable
  attr_accessor :task_name, :due_date, :priority

  # initialize name, date and priority of task
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

  # view the tasks method
  def view_tasks
    # index variable to count 
    index = 1
    puts "=====View Tasks====="
    # display each tasks with an index by going though with a loop
    @tasks.each do |task|
      puts "===Task #{index}==="
      puts "Name: #{task.task_name}"
      puts "Due Date: #{task.due_date}"
      puts "Priority: #{task.priority}"

      index += 1 # increment index 
    puts
    end
  end

  # add task method
  def add_task
    # ask user for inputs 
    puts "=====Add Task====="
    print "Enter task name: " # using print to not get the new line of puts
    task_name = gets.chomp
    print "Enter due date (YYYYMMDD): "
    due_date = gets.chomp
    due_date_formatted = Date.parse(due_date) # formate the date
    print "Enter priority (high, medium, low): "
    priority = gets.chomp
    puts

    # create a new task class with the user inputs 
    task = Task.new(task_name, due_date_formatted, priority)
    @tasks.push(task) # put the new task into the array
  end

  # delete task method
  def delete_task
    view_tasks # show the tasks that are aviable to users
    loop do
      # ask user which task to delete
      print "Enter the task you want to delete? The number: "
      index = gets.chomp.to_i

      # if the number is valid
      if index > 0 and index <= @tasks.length
        @tasks.delete_at(index - 1) # delete the task
        puts "Task deleted"
        puts
        break # and break out of loop
      else
        puts "Error! Invalid Number"
      end
    end
  end

  # run method to run the program
  def run
    loop do
      # welcome menu
      puts "=====Welcome====="
      puts "1: Add task"
      puts "2: Delete task"
      puts "3: View tasks"
      puts "4: Exit"
      print "Choice: "
      choice = gets.chomp.to_i
      puts

      case choice
      when 1
        add_task
      when 2
        delete_task
      when 3
        view_tasks
      when 4
        puts "Exiting"
        break # break to exit out of loop and end the program
      else
        puts "Error! Invalid Number"
      end
    end
  end
end
