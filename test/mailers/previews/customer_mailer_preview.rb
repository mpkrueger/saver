# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/signup_bill
  def signup_bill
    CustomerMailer.signup_bill(Customer.last)
  end

end
