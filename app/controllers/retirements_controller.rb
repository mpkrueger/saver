class RetirementsController < ApplicationController
  def index
  	@retirements = Retirement.all
  end

  def new
  end

  def show
  	@retirement = Retirement.find(params[:id])
  end

  def create
  	@retirement = Retirement.new(params.require(:retirement).permit(:savings, :age, :years_remaining, :annual_spend))

  	if @retirement.save
  		flash[:notice] = "Retirement info saved"
  		redirect_to @retirement
  	else
  		flash[:error] = "uh oh"
  		render :new
  	end
  end



  def edit
  end
end
