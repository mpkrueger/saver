class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.signup_bill.subject
  #
  def signup_bill(customer)
    @customer = customer

    
    @subject = "Send us your bill so we can save you money"

    mail(to: @customer.email, subject: @subject)
  end

  def delayed_signup_email(customer)
    @customer = customer

    
    @subject = "Sorry that your Savvy email was delayed on #{@customer.created_at.strftime("%A")}!"

    mail(to: @customer.email, subject: @subject)
  end

  def bill_reminder(customer)
    @customer = customer

    
    @subject = "Send bill, save money!"

    mail(to: @customer.email, subject: @subject)
  end
end
  