require 'test_helper'

class SaverGuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get intro" do
    get saver_guests_intro_url
    assert_response :success
  end

  test "should get intro2" do
    get saver_guests_intro2_url
    assert_response :success
  end

end
