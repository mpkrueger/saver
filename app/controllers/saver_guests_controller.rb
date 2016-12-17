class SaverGuestsController < ApplicationController
	def new
	end

	def create
		@saver_guest = SaverGuest.new(saver_guest_params)
		if @saver_guest.save
			session[:saver_guest_id] = @saver_guest.id
			redirect_to intro2_saver_guests_path
		else
			flash[:error] = "uh oh"
			redirect_to root_path
		end
	end

  def intro
  	@saver_guest = SaverGuest.new
  end

  def intro2
  	@saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
  end

  def update
  		@saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
  		if @saver_guest.update_attributes(saver_guest_params)
  			SaverGuestMailer.guest_signup(@saver_guest).deliver
  			redirect_to thanks_saver_guests_path
  		else
  			flash[:error] = "uh oh"
  			redirect_to root_path
  		end
  end

  private

	def saver_guest_params
		params.require(:saver_guest).permit(:name, :last_moved, :negotiated, :another_year, :email, 
			services: [:cable, :phone, :internet, :other])
	end


end
