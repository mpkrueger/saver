class ChargesController < ApplicationController
	before_action :authenticate_customer!

	def new
		@customer = current_customer
	end

	def create
	  @customer = current_customer

	  # Amount in cents
	  @amount = @customer.tickets.last.amount_earned

	  if @customer.payment_methods.present?
	  	stripe_customer = Stripe::Customer.retrieve(@customer.payment_methods.last.stripe_customer_id)
	  else
	  	stripe_customer = Stripe::Customer.create(
	    	:email => params[:stripeEmail],
	    	:source  => params[:stripeToken]
	  	)

	  	payment_method = PaymentMethod.create(
	  		stripe_customer_id: stripe_customer[:id],
	  		customer: @customer
	  	)
	  end

	  charge = Stripe::Charge.create(
	    :customer    => stripe_customer.id,
	    :amount      => @amount,
	    :description => 'Payment for cable/internet negotiation',
	    :metadata => {"Savvy customer id" => @customer.id},
	    :currency    => 'usd'
	  )

	  Payment.create(
	  	stripe_charge_id: charge[:id],
	  	customer: @customer,
	  	payment_method: payment_method
	  )
	  

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
