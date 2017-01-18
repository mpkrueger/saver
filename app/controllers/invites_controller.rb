class InvitesController < ApplicationController
  def new
  	@invite = Invite.new
    my_desired_path = invite_path
    store_location_for(:customer, my_desired_path)
  end

  def create
  	@invite = Invite.new(invite_params)
  	@customer = current_customer
  	@invite.customer = @customer

  	if @invite.save
  		InviteMailer.invitation(@invite).deliver
  		redirect_to thanks_invites_path
  	else
  		flash[:error] = "uh oh"
			redirect_to root_path
		end
  end

  def update
  end

  def show
    @referrer = params[:referrer]
  end

  def index
    @invites = Invite.all
  end

  private

  def invite_params
  	params.require(:invite).permit(:receiver_email, :incentive_amt, :email_message)
  end

  def resource_name
    :customer
  end
  helper_method :resource_name
 
  def resource
    @resource ||= Customer.new
  end
  helper_method :resource
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:customer]
  end
  helper_method :devise_mapping
 
  def resource_class
    Customer
  end
  helper_method :resource_class
end
