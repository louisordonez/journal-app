require 'test_helper'
require 'date'

class CreateTaskTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:user1) }

  test 'should create a task' do
    get category_tasks_path(categories(:category1))
    assert_response :success

    assert_difference 'Task.count' do
      post category_tasks_path,
           params: {
             task: {
               category_id: 1,
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
