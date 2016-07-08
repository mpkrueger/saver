require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goals_index_url
    assert_response :success
  end

  test "should get loan" do
    get goals_loan_url
    assert_response :success
  end

  test "should get house" do
    get goals_house_url
    assert_response :success
  end

  test "should get retirement" do
    get goals_retirement_url
    assert_response :success
  end

end
