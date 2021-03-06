class InvitesController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :thanks]

  def new
  	@invite = Invite.new
    @customer = current_customer
    if(@customer)
      @invite_url = "www.getsavvier.com/r/#{@customer.invite_url_param}"
    else
      @invite_url = "http://try.getsavvier.com"
    end
    my_desired_path = invite_path
    store_location_for(:customer, my_desired_path)
  end

  def thanks
    @customer = current_customer
    if(@customer)
      @invite_url = "www.getsavvier.com/r/#{@customer.invite_url_param}"
    end
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
    @referrer = Customer.find_by_invite_url_param(params[:sender])

    if @referrer
      @sender_name = @referrer.first_name.capitalize
      if @referrer.invite_url_param == "PrinciplesOfIncrease"
        @headline = "Principles of Increase"
        @subheading = "recommends saving money with Savvy!"
      elsif @referrer.invite_url_param == "LaurenGreutman"
        @headline = "Lauren Greutman"
        @subheading = "recommends saving money with Savvy!"
      elsif @referrer.invite_url_param == "derek"
        @headline = "How Do I Money"
        @subheading = "recommends saving money with Savvy!"
        @celebrate_with = "and #{@sender_name} can "
      else
        @headline = "#{@sender_name} wants you to get easy savings with Savvy!"
        @subheading = "Sign up now and get a $20 Amazon gift card when you save with Savvy"
        @celebrate_with = "and #{@sender_name} can "
      end
    else
      @sender_name = "A friend"
      @headline = "#{@sender_name} wants you to get easy savings with Savvy!"
      @subheading = "What an awesome friend."
    end

    

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
