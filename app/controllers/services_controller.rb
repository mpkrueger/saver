class ServicesController < ApplicationController
  before_action :authenticate_user!

  def welcome
    @user = current_user
    @amount = @user.investing_profile.amount_to_get_started
    @post_investment_goal = @user.investing_profile.post_investment_goal
  end

  def overview
  end

  def factors
  end

  def fees
  end

  def easeandflex
  end

  def reputation
  end

  def summary
  end

  def recommendation
    @user = current_user
    @investing_profile = @user.investing_profile
    @amount = @user.investing_profile.amount_to_get_started
    @post_investment_goal = @user.investing_profile.post_investment_goal
  end

  def vanguard
    @user = current_user
    @investing_profile = @user.investing_profile
  end

  def vanguard_instructions
    @user = current_user
    @investing_feedback = @user.investing_feedback
  end

  def betterment
    @user = current_user
    @investing_profile = @user.investing_profile
    @investing_feedback = @user.investing_feedback
  end

  def choice
  end
end
