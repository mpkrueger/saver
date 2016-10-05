require 'test_helper'

class BetaUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beta_users_new_url
    assert_response :success
  end

end
