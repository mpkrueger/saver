class LoansController < ApplicationController
  def index
  	@loans = Loan.all
  end

  def show
  	@loan = Loan.find(params[:id])
    @monthly_rate = @loan.rate/ 100 / 12

  end

  def create
  	@loan = Loan.new(params.require(:loan).permit(:balance, :rate, :months_remaining))
  	# TO DO create user account to tie loan to
  	# @loan.user = current_user

  	if @loan.save
  		flash[:notice] = "Loan info saved"
  		redirect_to @loan
  	else
  		flash[:error] = "uh oh"
  		render :new
  	end
  end

  def new
  end

  def edit
  end
end
