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

    attachments.inline['lp_hero_image.png'] = File.read("#{Rails.root}/app/assets/images/lp_hero_image.png")
    attachments.inline['fb_circle_icon.png'] = File.read("#{Rails.root}/app/assets/images/fb_circle_icon.png")
    attachments.inline['twitter_circle_icon.png'] = File.read("#{Rails.root}/app/assets/images/twitter_circle_icon.png")

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
