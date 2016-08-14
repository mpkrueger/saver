class ChallengesController < ApplicationController
  def saving_info
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def credit_card_info
    @user = current_user
    @fin_profile = @user.fin_profile
    @cc_feeling = @user.fin_profile.cc_feeling
    @cc_approach = @user.fin_profile.cc_approach
    @cc_rate = @user.fin_profile.cc_rate
    @cc_amount = @user.fin_profile.cc_amount
  end

  def student_loan_info
    @user = current_user
    @fin_profile = @user.fin_profile
    @student_feeling = @user.fin_profile.student_feeling
    @student_approach = @user.fin_profile.student_approach
    @student_rate = @user.fin_profile.student_rate
    @student_ammount = @user.fin_profile.student_ammount
  end

  def investment_info
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def saving_model
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def credit_card_model
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def student_loan_model
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def investment_model
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def saving_challenge
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def investment_challenge
    @user = current_user
    @fin_profile = @user.fin_profile
  end

  def get_started
    @user = current_user
    @fin_profile = @user.fin_profile
  end
end
