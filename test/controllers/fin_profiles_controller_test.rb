require 'test_helper'

class FinProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fin_profiles_new_url
    assert_response :success
  end

  test "should get show" do
    get fin_profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get fin_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get fin_profiles_update_url
    assert_response :success
  end

end
