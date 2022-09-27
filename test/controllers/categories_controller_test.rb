require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:user1) }

  test 'should get index' do
    get categories_path
    assert_response :success
  end
end
