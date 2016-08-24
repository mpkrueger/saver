class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def guest_user
    @guest_user ||= session[:guest_user_id] &&
      GuestUser.find_by(id: session[:guest_user_id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :chat_type, :contact_prefs])
  end

end
