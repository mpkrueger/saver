# Preview all emails at http://localhost:3000/rails/mailers/beta_mailer
class BetaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/beta_mailer/beta_intro
  def beta_intro
    BetaMailer.beta_intro(BetaUser.last)
  end

end