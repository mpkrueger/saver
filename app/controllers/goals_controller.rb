class GoalsController < ApplicationController
  def index
  end

  def loan
  	@loan = Loan.new
  end

  def house
  	@house = House.new
  end

  def retirement
  end
end
