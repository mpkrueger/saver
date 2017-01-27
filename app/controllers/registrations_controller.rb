class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit]

  # GET /resource/sign_up
  def new
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    # create the invite_url_param from the first part of their email and strip out periods
    resource.invite_url_param = resource.email.split("@").first.tr(".", "")

    resource.save
    yield resource if block_given?
    if resource.persisted?
      
      # if the customer is signing up on the invite landing page & doesn't yet have an invite associated with them
      # this code will create an invite for them
      if resource.referred_by
        unless Invite.find_by_receiver_email(resource.email)
          if Customer.find_by_invite_url_param(resource.referred_by)
            @invite = Invite.new(receiver_email: resource.email)
            @invite.customer = Customer.find_by_invite_url_param(resource.referred_by)
            @invite.save
          end
        end
      end

      # if the customer doesn't already have a saver_guest with the same email:
      unless SaverGuest.find_by_email(resource.email)
        
        # send the customer an email asking them to send us their bill
        # (if they have a saver guest with that email, they've already received the send us your bill email)
        CustomerMailer.signup_bill(resource).deliver

        # create a ticket that will be used to track their bill and savings
        @ticket = Ticket.new
        @ticket.customer = resource
        @ticket.save
      end

      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource

      # this sends the errors associated with signing up to whichever page the signup is occuring on
      resource.errors.messages.keys.each {|x| set_flash_message :error, x}
      
      # if the customer is signing up on the invite landing page and has an error
      # send them back to the invite landing page
      # otherwise send them back to the page they were signing up on
      binding.pry
      if resource.referred_by
        redirect_to "https://www.getsavvier.com/r/#{resource.referred_by}", turbolinks: false
      elsif stored_location_for(resource)
        redirect_to after_sign_up_path_for(resource)
      else
        respond_with resource
      end
    end
  end

  # GET /resource/edit
  def edit
    # render :edit
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      # clean_up_passwords resource
      # set_minimum_password_length
      flash[:error] = "That link is already taken"
      redirect_to invite_path
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end

  protected

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end

  # By default we want to require a password checks on update.
  # You can overwrite this method in your own RegistrationsController.
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    stored_location_for(:customer) || root_path
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    scope = Devise::Mapping.find_scope!(resource)
    router_name = Devise.mappings[scope].router_name
    context = router_name ? send(router_name) : self
    context.respond_to?(:root_path) ? context.root_path : "/"
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    stored_location_for(:customer) || root_path
  end

  # Authenticates the current scope and gets the current resource from the session.
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", force: true)
    self.resource = send(:"current_#{resource_name}")
  end

  def sign_up_params
    params.require(:customer).permit(:first_name, :email, :password, :referred_by)
  end

  def account_update_params
    params.require(:customer).permit(:invite_url_param)
  end

  def translation_scope
    'devise.registrations'
  end
end