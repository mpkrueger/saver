class BetaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.beta_mailer.beta_intro.subject
  #
  def beta_intro(user)
    @user = user
    @subject = "Welcome to Savvy!"

    mail(to: @user.email, subject: @subject)
  end

  def get_started(beta_user)
    @beta_user = beta_user
    @subject = "Let's invest!"

    mail(to: @beta_user.email, subject: @subject)
  end

  def follow_up(beta_user)
    @beta_user = beta_user
    @subject = "Let's do this!"

    mail(to: @beta_user.email, subject: @subject)
  end

  def user_profile(user)
    @user = user
    @investing_profile = @user.investing_profile
    @subject = "New user info"

    mail(to:["mpkrueger@gmail.com", "ssubrama@gmail.com"], subject: @subject)
  end

  def send_user_profile(id)
    @id = id
    @user = User.find_by_id(@id)

    BetaMailer.user_profile(@user).deliver
  end

  def send_get_started(ids)
    @ids = []
    @ids = ids
    @ids.each do |id|
      BetaMailer.get_started(BetaUser.find_by_id(id)).deliver
    end
  end

  def send_follow_up(ids)
    @ids = []
    @ids = ids
    @ids.each do |id|
      BetaMailer.follow_up(BetaUser.find_by_id(id)).deliver
    end
  end
end
