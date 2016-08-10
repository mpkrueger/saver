class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def guest_user
    @guest_user ||= session[:guest_user_id] &&
      GuestUser.find_by(id: session[:guest_user_id])
  end

end
