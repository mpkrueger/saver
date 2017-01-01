class BillsController < ApplicationController

  def new
  	@saver_guest = SaverGuest.find_by_id(params[:saver_guest_id])
    @bill = Bill.new
  end

  def create
  	@bill = Bill.new(bill_params)
    @saver_guest = SaverGuest.find_by_id(params[:saver_guest_id])
    @ticket = @saver_guest.tickets.last
    @ticket.has_bill = true
    @ticket.save
    @bill.ticket = @ticket

  	if @bill.save
  		redirect_to thanks_saver_guests_path
  	else
  		render "new"
    end
  end

  def show
    @saver_guest = SaverGuest.find_by_id(params[:saver_guest_id])
    @ticket = @saver_guest.tickets.last
    @bill = @ticket.bill
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
