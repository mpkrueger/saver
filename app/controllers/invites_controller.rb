class InvitesController < ApplicationController
  def new
  	@invite = Invite.new
    @customer = current_customer
    if(@customer)
      @invite_url = "www.getsavvier.com/r/#{@customer.invite_url_param}"
    end
    my_desired_path = invite_path
    store_location_for(:customer, my_desired_path)
  end

  def create
  	@emails = invite_params[:receiver_email].split(/,\s*/)
    @emails.each do |email|
      @invite = Invite.new(receiver_email: email, incentive_amt: invite_params[:incentive_amt], 
        email_message: invite_params[:email_message])
    	@customer = current_customer
    	@invite.customer = @customer

    	if @invite.save
    		InviteMailer.invitation(@invite).deliver
    	else
    		flash[:error] = "uh oh"
  			redirect_to invite_path
  		end
    end
    redirect_to thanks_invites_path
  end

  def update
  end

  def show
    @sender = Customer.find_by_invite_url_param(params[:sender])
    store_location_for(:customer, thanks_invites_path)
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
