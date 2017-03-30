class OnboardingController < ApplicationController
  def why_savvy
  end

  def landing_page
    expires_in 1.year, :public => true
  end

  def landing_page_photo2
    expires_in 1.year, :public => true
  end

  def landing_page_vector
    expires_in 1.year, :public => true
  end

  def landing_page_painpoints
    expires_in 1.year, :public => true
  end

  def landing_page_busymom
    expires_in 1.year, :public => true
  end

  def landing_page_education
    expires_in 1.year, :public => true
  end

end
