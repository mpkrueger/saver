class HousesController < ApplicationController
  def index
  	@houses = House.all
  end

  def new
  end

  def create
  	@house = House.new(params.require(:house).permit(:budget, :down_payment, :years_owning))

  	if @house.save
  		flash[:notice] = "House info saved"
  		redirect_to @house
  	else
  		flash[:error] = "uh oh"
  		render :new
  	end
  end

  def show
  	@house = House.find(params[:id])
  end

  def edit
  end
end
