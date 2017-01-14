class SaverGuestsController < ApplicationController

  def new
	end

	def create
		@saver_guest = SaverGuest.new(saver_guest_params)
		@ticket = Ticket.new
		@ticket.saver_guest = @saver_guest
		@ticket.save
		if @saver_guest.save
			session[:saver_guest_id] = @saver_guest.id
			SaverGuestMailer.guest_signup(@saver_guest).deliver
			if @saver_guest.flow == "1"
				redirect_to thanks_saver_guests_path
			else 
				redirect_to thanks_saver_guests_path
			end
		else
			flash[:error] = "uh oh"
			redirect_to root_path
		end
	end

  def signup
  	@saver_guest = SaverGuest.new
  end

  def signup2
  	@saver_guest = SaverGuest.new
  end

  def signup3
  	@saver_guest = SaverGuest.new
  end

  def thanks
  	@saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
  end

  def update
  		
  end

  private

	def saver_guest_params
		params.require(:saver_guest).permit(:name, :last_moved, :negotiated, :another_year, :email, :flow, 
			services: [:cable, :phone, :internet, :other])
	end


end
