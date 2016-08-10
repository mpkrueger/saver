class RegistrationsController < Devise::RegistrationsController
	def new
		@guest_user = current_user
		@weakness = @guest_user.weakness
		super
	end
end
