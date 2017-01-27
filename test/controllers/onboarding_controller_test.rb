require 'test_helper'

class OnboardingControllerTest < ActionDispatch::IntegrationTest
  test "should get why_savvy" do
    get onboarding_why_savvy_url
    assert_response :success
  end

  test "should get landing_page" do
    get onboarding_landing_page_url
    assert_response :success
  end

end
