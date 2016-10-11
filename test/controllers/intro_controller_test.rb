require 'test_helper'

class IntroControllerTest < ActionDispatch::IntegrationTest
  test "should get introduction" do
    get intro_introduction_url
    assert_response :success
  end

  test "should get introduction_2" do
    get intro_introduction_2_url
    assert_response :success
  end

  test "should get ways_to_invest" do
    get intro_ways_to_invest_url
    assert_response :success
  end

  test "should get diversification" do
    get intro_diversification_url
    assert_response :success
  end

  test "should get risks" do
    get intro_risks_url
    assert_response :success
  end

  test "should get access" do
    get intro_access_url
    assert_response :success
  end

  test "should get takeaways" do
    get intro_takeaways_url
    assert_response :success
  end

  test "should get investment_goal" do
    get intro_investment_goal_url
    assert_response :success
  end

  test "should get post_investment" do
    get intro_post_investment_url
    assert_response :success
  end

  test "should get initial_investment" do
    get intro_initial_investment_url
    assert_response :success
  end

  test "should get retirement_account" do
    get intro_retirement_account_url
    assert_response :success
  end

  test "should get investment_experience" do
    get intro_investment_experience_url
    assert_response :success
  end

  test "should get debt" do
    get intro_debt_url
    assert_response :success
  end

  test "should get other_thoughts" do
    get intro_other_thoughts_url
    assert_response :success
  end

  test "should get follow_up" do
    get intro_follow_up_url
    assert_response :success
  end

end
