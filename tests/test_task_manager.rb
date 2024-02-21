require 'minitest/autorun'
require "./task_manager"

class TestTaskManager < Minitest::Test

  # checking if test is initializie correctly
  def test_initialization
    test_task = Task.new("testing", "20000101", "high")
    assert_equal "testing", test_task.task_name, "Not equal"
    assert_equal "20000101", test_task.due_date, "Not equal"
    assert_equal "high", test_task.priority, "Not equal"
  end

end
