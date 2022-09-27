require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user1)
    sign_out users(:user1)
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end
end
