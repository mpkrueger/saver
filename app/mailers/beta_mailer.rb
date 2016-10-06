class BetaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.beta_mailer.beta_intro.subject
  #
  def beta_intro(beta_user)
    @beta_user = beta_user
    @subject = "Investing in 3 simple steps - coming soon!"

    mail(to: @beta_user.email, subject: @subject)
  end
end