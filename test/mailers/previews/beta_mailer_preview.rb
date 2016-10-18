# Preview all emails at http://localhost:3000/rails/mailers/beta_mailer
class BetaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/beta_mailer/beta_intro
  def beta_intro
    BetaMailer.beta_intro(BetaUser.last)
  end

  def get_started
  	BetaMailer.get_started(BetaUser.last)
  end

  def follow_up
  	BetaMailer.follow_up(BetaUser.last)
  end

  def user_profile
    BetaMailer.user_profile(User.last)
  end

end
