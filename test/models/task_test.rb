require 'test_helper'
require 'date'

class TaskTest < ActiveSupport::TestCase
  test 'should not save task without title' do
    task = Task.new
    task.description = 'Task Description'
    task.deadline = Date.today
    assert_not task.save, 'saved the task without title'
  end

  test 'should not save task if title is less than 2 characters' do
    task = Task.new
    task.title = 'T'
    task.description = 'Task Description'
    task.deadline = Date.today
    assert_not task.save, 'saved the task with title less than 2 characters'
  end

  test 'should not save task without description' do
    task = Task.new
    task.title = 'Task Title'
    task.deadline = Date.today
    assert_not task.save, 'saved the task without description'
  end

  test 'should not save task if description is less than 2 characters' do
    task = Task.new
    task.title = 'Task Title'
    task.description = 'T'
    task.deadline = Date.today
    assert_not task.save, 'saved the task with description less than 2 characters'
  end

  test 'should not save task without deadline' do
    task = Task.new
    task.title = 'Task Title'
    task.description = 'Task Description'
    assert_not task.save, 'saved the task without deadline'
  end
end
