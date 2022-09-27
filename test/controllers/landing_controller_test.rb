require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test 'should get index' do
    sign_out users(:one)

    get root_path
    assert_response :success
  end
end
