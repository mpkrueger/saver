# Preview all emails at http://localhost:3000/rails/mailers/saver_guest_mailer
class SaverGuestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/saver_guest_mailer/guest_signup
  def guest_signup
    SaverGuestMailer.guest_signup(SaverGuest.last)
  end

  def bill_reminder
  	SaverGuestMailer.bill_reminder(SaverGuest.last)
  end

  def bill_reminder_v2
  	SaverGuestMailer.bill_reminder_v2(SaverGuest.last)
  end

end
