require 'test_helper'

class BetaMailerTest < ActionMailer::TestCase
  test "beta_intro" do
    mail = BetaMailer.beta_intro
    assert_equal "Beta intro", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
