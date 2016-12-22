class BillsController < ApplicationController
  def index
  	@bills = Bill.all
  end

  def new
  	@bill = Bill.new
  end

  def create
  	@bill = Bill.new(bill_params)
    @bill.name = "Saver Guest ID: #{SaverGuest.find_by_id(session[:saver_guest_id]).id}"
    @saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
    @bill.saver_guest = @saver_guest

  	if @bill.save
  		redirect_to thanks_saver_guests_path
  	else
  		render "new"
    end
  end

  def destroy
  	@bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to bills_path, notice:  "The bill #{@bill.name} has been deleted."
  end

  private
    def bill_params
      params.require(:bill).permit(:name, :attachment)
  	end

end
