class DashboardsController < ApplicationController
  before_action :authenticate_customer!
  
  def dashboard
  	@customer = current_customer
  	@ticket = Ticket.find_by_customer_id(@customer.id)
  end
end
