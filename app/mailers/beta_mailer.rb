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

  def get_started(beta_user)
    @beta_user = beta_user
    @subject = "Let's invest!"

    mail(to: @beta_user.email, subject: @subject)
  end

  def send_get_started(ids)
    @ids = []
    @ids = ids
    @ids.each do |id|
      BetaMailer.get_started(BetaUser.find_by_id(id)).deliver
    end
  end
end
