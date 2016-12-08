require 'test_helper'

class SaverGuestMailerTest < ActionMailer::TestCase
  test "guest_signup" do
    mail = SaverGuestMailer.guest_signup
    assert_equal "Guest signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
