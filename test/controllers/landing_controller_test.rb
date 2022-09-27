require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    sign_out users(:one)
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end
end
