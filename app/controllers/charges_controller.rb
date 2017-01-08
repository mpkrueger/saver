class ChargesController < ApplicationController
	def new
		@saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])
	end

	def create
	  # Amount in cents
	  @amount = 500
	  @saver_guest = SaverGuest.find_by_id(session[:saver_guest_id])

	  if @saver_guest.payment_methods.present?
	  	stripe_customer = Stripe::Customer.retrieve(@saver_guest.payment_methods.last.stripe_customer_id)
	  else
	  	stripe_customer = Stripe::Customer.create(
	    	:email => params[:stripeEmail],
	    	:source  => params[:stripeToken]
	  	)

	  	PaymentMethod.create(
	  		stripe_customer_id: stripe_customer[:id],
	  		saver_guest: @saver_guest
	  	)
	  end

	  charge = Stripe::Charge.create(
	    :customer    => stripe_customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
	  

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
