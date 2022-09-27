require 'test_helper'
require 'date'

class CreateTaskTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test 'should create a task' do
    category = Category.create({ name: 'Test Category Name' })
    get category_tasks_path(category)
    assert_response :success

    assert_difference 'Task.count' do
      post category_tasks_path,
           params: {
             task: {
               title: 'Test Task Title',
               description: 'Test Task Description',
               deadline: Date.today,
             },
           }
      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
  end
end
