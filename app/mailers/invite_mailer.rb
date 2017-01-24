class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invitation.subject
  #
  def invitation(invite)
    @invite = invite
    @customer = invite.customer

    @subject = "#{@invite.customer.first_name} wants to help you save money with no effort"

    mail(to: @invite.receiver_email, subject: @subject)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.claim_your_reward.subject
  #
  def claim_your_reward
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
