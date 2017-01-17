class InvitesController < ApplicationController
  def new
  	@invite = Invite.new
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

  private

  def invite_params
  	params.require(:invite).permit(:receiver_email, :incentive_amt, :email_message)
  end
end
