class SaverGuestsController < ApplicationController

  def new
	end

	def create
		@saver_guest = SaverGuest.new(saver_guest_params)
		if @saver_guest.save
			session[:saver_guest_id] = @saver_guest.id
			redirect_to bill_saver_guests_path
		else
			flash[:error] = "uh oh"
			redirect_to root_path
		end
	end

  def signup
  	@saver_guest = SaverGuest.new
  end

  def bill
  	@saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
    @bill = Bill.new
  end

  def thanks
  	@saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
  end

  def update
  		
  end

  private

	def saver_guest_params
		params.require(:saver_guest).permit(:name, :last_moved, :negotiated, :another_year, :email, 
			services: [:cable, :phone, :internet, :other])
	end


end
