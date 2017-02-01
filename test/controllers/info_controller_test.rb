require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get info_about_us_url
    assert_response :success
  end

  test "should get faq" do
    get info_faq_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get info_privacy_policy_url
    assert_response :success
  end

  test "should get terms_of_service" do
    get info_terms_of_service_url
    assert_response :success
  end

end
