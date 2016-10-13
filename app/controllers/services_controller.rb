class ServicesController < ApplicationController
  before_action :authenticate_user!

  def welcome
    @user = current_user
    @amount = @user.investing_profile.amount_to_get_started
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
  end

  def choice
  end
end
