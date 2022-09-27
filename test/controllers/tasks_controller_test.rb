require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:user1) }

  test 'should get index' do
    get category_tasks_path(categories(:category1))
    assert_response :success
  end
end
