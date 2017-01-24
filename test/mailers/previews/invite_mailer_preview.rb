# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/invitation
  def invitation
    InviteMailer.invitation
  end

  # Preview this email at http://localhost:3000/rails/mailers/invite_mailer/claim_your_reward
  def claim_your_reward
    InviteMailer.claim_your_reward
  end

end