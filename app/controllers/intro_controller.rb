class IntroController < ApplicationController
  include Wicked::Wizard

  steps :get_started, :student_loans_info, :student_loans_summary, :credit_cards, :savings, 
  	:investments, :spending, :present_day, :future, :present_vs_future, :financial_score

  def show
  	@user = User.find(params[:id])

  	render_wizard
  end

  def update
  	@user = User.last
  	@user.update_attributes(params[:user])
  	render_wizard @user
  end
end
