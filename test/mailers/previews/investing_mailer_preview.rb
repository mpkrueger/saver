# Preview all emails at http://localhost:3000/rails/mailers/investing_mailer
class InvestingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/investing_mailer/investment_feedback
  def investment_feedback
    InvestingMailer.investment_feedback(User.last)
  end

  # Preview this email at http://localhost:3000/rails/mailers/investing_mailer/choice_follow_up
  def choice_follow_up
    InvestingMailer.choice_follow_up
  end

end
