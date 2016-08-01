require 'test_helper'

class IntroControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get intro_show_url
    assert_response :success
  end

end
