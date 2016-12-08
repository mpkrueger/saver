class SaverGuestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.saver_guest_mailer.guest_signup.subject
  #
  def guest_signup(user)
    @user = user
    
    @subject = "Saving you money on your cable & internet bill"

    if(@user.last_moved == 'more than a year ago' && @user.negotiated == "no")
      if(@user.services['phone']=='1' && @user.services['internet']=='1' && @user.services['cable']=='1')
        @custom_message = "You mentioned that you have all 3 services - cable tv, internet, and phone - which means we are confident we can save you more than $500 per year."
      else
        @custom_message = "Because you’ve had service for more than a year in your current location, we’re confident that we can save you more than $300 per year."
      end
    elsif @user.last_moved == 'less than a year ago'
      @custom_message = "Because you’ve moved in the last year, there may be less of an opportunity to negotiate a lower price - your latest bill will tell us a lot. We will compare your rate to other people with similar services and see if we can save you some money."
    elsif @user.negotiated == 'yes'
      @custom_message = "Because you’ve negotiated a better rate in the last year, there may be less of an opportunity to negotiate a lower price on your behalf - your latest bill will tell us a lot. We will compare your rate to other people with similar services and see if we can save you some money."
    end


    mail(to: @user.email, subject: @subject)
  end
end
