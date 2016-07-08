class GoalsController < ApplicationController
  def index
  end

  def loan
  		@loan = Loan.new
  end

  def house
  end

  def retirement
  end
end
