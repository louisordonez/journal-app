require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:test_user) }

  test 'should get index' do
    sign_out users(:test_user)

    get root_path
    assert_response :success
  end
end
