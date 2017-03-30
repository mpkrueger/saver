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

  def referral_program_notice(saver_guest)
    @saver_guest = saver_guest

    @subject = "Earn $10 for each friend who saves with Savvy"

    mail(to: @saver_guest.email, subject: @subject)
  end

  def give_20_get_20_email(customer)
    @customer = customer

    @subject = "Give $20, Get $20!"

    mail(to: @customer.email, subject: @subject)
  end

  def sg_give_20_get_20_email(customer)
    @customer = customer

    @subject = "Give $20, Get $20!"

    mail(to: @customer.email, subject: @subject)
  end
end
