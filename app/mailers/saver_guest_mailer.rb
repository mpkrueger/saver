class SaverGuestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.saver_guest_mailer.guest_signup.subject
  #
  def guest_signup(user)
    @user = user
    
    @subject = "What would you do with an extra $300?"

    if(@user.last_moved == 'More than a year ago' && @user.negotiated == "No")
      if(@user.services['phone']=='1' && @user.services['internet']=='1' && @user.services['cable']=='1')
        @custom_message = "You mentioned that you have all 3 services - cable tv, internet, and phone - which means we're confident we can save you more than $500 per year."
      else
        
      end
    elsif @user.last_moved == 'Less than a year ago'
      @custom_message = "Because you’ve moved in the last year, there may be less of an opportunity to negotiate a lower price - your latest bill will tell us a lot. We will compare your rate to other people with similar services and see if we can save you some money."
    elsif @user.negotiated == 'Yes'
      @custom_message = "Because you’ve negotiated a better rate in the last year, there may be less of an opportunity to negotiate a lower price on your behalf - your latest bill will tell us a lot. We will compare your rate to other people with similar services and see if we can save you some money."
    end


    mail(to: @user.email, subject: @subject)
  end
end
