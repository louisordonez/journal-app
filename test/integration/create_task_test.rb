require 'test_helper'
require 'date'

class CreateTaskTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test 'should create a task' do
    category = Category.create({ name: "#{categories(:one).name}" })
    get category_tasks_path(category)
    assert_response :success

    assert_difference 'Task.count' do
      post category_tasks_path,
           params: {
             task: {
               title: "#{tasks(:one).title}",
               description: "#{tasks(:one).description}",
               deadline: Date.today,
             },
           }
      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
  end
end
