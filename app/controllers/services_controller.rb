class ServicesController < ApplicationController
  before_action :authenticate_user!
  
  def welcome
    @user = current_user
    @amount = @user.investing_profile.amount_wants_to_invest
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
