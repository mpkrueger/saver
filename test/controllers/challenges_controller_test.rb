require 'test_helper'

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  test "should get saving_info" do
    get challenges_saving_info_url
    assert_response :success
  end

  test "should get credit_card_info" do
    get challenges_credit_card_info_url
    assert_response :success
  end

  test "should get student_loan_info" do
    get challenges_student_loan_info_url
    assert_response :success
  end

  test "should get investment_info" do
    get challenges_investment_info_url
    assert_response :success
  end

  test "should get saving_model" do
    get challenges_saving_model_url
    assert_response :success
  end

  test "should get credit_card_model" do
    get challenges_credit_card_model_url
    assert_response :success
  end

  test "should get student_loan_model" do
    get challenges_student_loan_model_url
    assert_response :success
  end

  test "should get investment_model" do
    get challenges_investment_model_url
    assert_response :success
  end

  test "should get saving_challenge" do
    get challenges_saving_challenge_url
    assert_response :success
  end

  test "should get investment_challenge" do
    get challenges_investment_challenge_url
    assert_response :success
  end

  test "should get get_started" do
    get challenges_get_started_url
    assert_response :success
  end

end
