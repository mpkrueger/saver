class IntroController < ApplicationController
  include Wicked::Wizard

  steps :info, :get_started, :student_loans_info, :student_loans_summary, :credit_cards, :savings, 
  	:investments, :spending, :present_day, :future, :present_vs_future, :financial_score

  def show
  	@user = User.last

  	render_wizard
  end
end
