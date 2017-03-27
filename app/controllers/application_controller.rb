class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :chat_type, :contact_prefs, :name, :email, :psasword, :current_password, :password_confirmation])
  end

end
