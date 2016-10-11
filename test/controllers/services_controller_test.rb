require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get services_welcome_url
    assert_response :success
  end

  test "should get overview" do
    get services_overview_url
    assert_response :success
  end

  test "should get factors" do
    get services_factors_url
    assert_response :success
  end

  test "should get fees" do
    get services_fees_url
    assert_response :success
  end

  test "should get easeandflex" do
    get services_easeandflex_url
    assert_response :success
  end

  test "should get reputation" do
    get services_reputation_url
    assert_response :success
  end

  test "should get summary" do
    get services_summary_url
    assert_response :success
  end

  test "should get recommendation" do
    get services_recommendation_url
    assert_response :success
  end

  test "should get choice" do
    get services_choice_url
    assert_response :success
  end

end
