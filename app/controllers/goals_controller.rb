class GoalsController < ApplicationController
  helper_method :current_or_guest_user

  def introductions
    

    @guest_user = GuestUser.new
  end

  def new_focus
  	@guest_user = guest_user
  end



end
