class InvestingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investing_mailer.investment_feedback.subject
  #
  def investment_feedback
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investing_mailer.choice_follow_up.subject
  #
  def choice_follow_up(user)
  	@user = user
    @greeting = "Hi"
    @subject = "Temptation Bundling: Investing + Treat Yo'Self"

    mail(to: @user.email, subject: @subject)
  end
end

