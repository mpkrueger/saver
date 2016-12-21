class BillsController < ApplicationController
  def index
  	@bills = Bill.all
  end

  def new
  	@bill = Bill.new
  end

  def create
  	@bill = Bill.new(bill_params)

  	if @bill.save
  		redirect_to bills_path, notice: "The bill #{@bill.name} has been uploaded."
  	else
  		render "new"
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

end
