require 'test_helper'

class SavvyScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get credit_cards" do
    get savvy_score_credit_cards_url
    assert_response :success
  end

  test "should get student_loans" do
    get savvy_score_student_loans_url
    assert_response :success
  end

  test "should get savings_total" do
    get savvy_score_savings_total_url
    assert_response :success
  end

  test "should get savings_habits" do
    get savvy_score_savings_habits_url
    assert_response :success
  end

  test "should get investments" do
    get savvy_score_investments_url
    assert_response :success
  end

  test "should get intro_outline" do
    get savvy_score_intro_outline_url
    assert_response :success
  end

  test "should get final_summary" do
    get savvy_score_final_summary_url
    assert_response :success
  end

end
