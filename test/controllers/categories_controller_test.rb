require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:test_user) }

  test 'should get index' do
    get categories_path
    assert_response :success
  end
end
