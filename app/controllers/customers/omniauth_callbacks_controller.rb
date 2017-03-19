class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
    @customer = Customer.find_with_omniauth(request.env["omniauth.auth"])

    if @customer.persisted?
      sign_in_and_redirect @customer #this will throw if @customer is not activated      
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_customer_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def facebook
    	# You need to implement the method below in your model (e.g. app/models/customer.rb)
    	@customer = Customer.from_omniauth(request.env["omniauth.auth"])

    	if request.env["omniauth.auth"].info.email.blank?
	      redirect_to "/customers/auth/facebook?auth_type=rerequest&scope=email"
	    end

    	if @customer.persisted?
    		sign_in_and_redirect @customer #this will throw if @customer is not activated   		
    	else
    		session["devise.facebook_data"] = request.env["omniauth.auth"]
    		redirect_to new_customer_registration_url, alert: @user.errors.full_messages.join("\n")
    	end
  	end

  def failure
    redirect_to root_path
  end
end