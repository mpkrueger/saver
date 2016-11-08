class GoalsController < ApplicationController
  helper_method :current_or_guest_user

  def invest_introductions
    @guest_user = GuestUser.new
  end

  def savvy_score_introductions
    @savvy_score_user = SavvyScoreUser.new
  end

  def new_focus
  	@guest_user = guest_user
  end

  def investing
  	@beta_user = BetaUser.new
  end

  def thanks
    @beta_user = BetaUser.find_by_email(params[:email])
  end



end
