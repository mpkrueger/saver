class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.signup_bill.subject
  #
  def signup_bill(customer)
    @customer = customer

    attachments.inline['lp_hero_image.png'] = File.read("#{Rails.root}/app/assets/images/lp_hero_image.png")
    attachments.inline['fb_circle_icon.png'] = File.read("#{Rails.root}/app/assets/images/fb_circle_icon.png")
    attachments.inline['twitter_circle_icon.png'] = File.read("#{Rails.root}/app/assets/images/twitter_circle_icon.png")
    
    @subject = "Send us your bill so we can save you money"

    mail(to: @customer.email, subject: @subject)
  end
end
  