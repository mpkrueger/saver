require 'test_helper'

class InvestingMailerTest < ActionMailer::TestCase
  test "investment_feedback" do
    mail = InvestingMailer.investment_feedback
    assert_equal "Investment feedback", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "choice_follow_up" do
    mail = InvestingMailer.choice_follow_up
    assert_equal "Choice follow up", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
