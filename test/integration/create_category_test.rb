require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test 'should create a category' do
    get categories_path
    assert_response :success

    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Test Category Title' } }
      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
  end
end
