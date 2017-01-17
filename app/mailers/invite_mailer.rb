class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invitation.subject
  #
  def invitation(invite)
    @invite = invite

    @subject = "#{@invite.customer.email} wants you to save some money!"

    if @invite.email_message.nil?
      @message = "#{@invite.customer.email} used Savvy and wants you to give it a try as well!"
    else
      @message = @invite.email_message
    end

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
