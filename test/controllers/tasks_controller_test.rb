require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test 'should get index' do
    category = Category.create({ name: "#{categories(:one).name}" })
    get category_tasks_path(category)
    assert_response :success
  end
end
