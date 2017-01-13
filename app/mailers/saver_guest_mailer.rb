class SaverGuestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.saver_guest_mailer.guest_signup.subject
  #
  def guest_signup(user)
    @user = user
    
    @subject = "Send us your bill so we can save you money"

    mail(to: @user.email, subject: @subject)
  end


  def bill_reminder(user)
    @user = user
    @subject = "Take two minutes to kick off the new year with easy savings."

    mail(to: @user.email, subject: @subject)
  end

  def bill_reminder_v2(user)
    @user = user
    @subject = "Take two minutes to kick off the new year with easy savings."

    mail(to: @user.email, subject: @subject)
  end
end
