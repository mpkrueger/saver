class GoalsController < ApplicationController
  helper_method :current_or_guest_user

  def introductions
    

    @guest_user = GuestUser.new
  end



end
