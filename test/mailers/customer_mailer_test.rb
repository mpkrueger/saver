require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "signup_bill" do
    mail = CustomerMailer.signup_bill
    assert_equal "Signup bill", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
