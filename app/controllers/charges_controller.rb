class ChargesController < ApplicationController
	before_action :authenticate_customer!

	def new
		@customer = current_customer
	end

	def create
	  @customer = current_customer
	  @ticket = Ticket.find_by_customer_id(@customer.id)

	  # Amount in cents
	  @amount = @customer.tickets.last.amount_earned

	  if @customer.payment_methods.present?
	  	stripe_customer = Stripe::Customer.retrieve(@customer.payment_methods.last.stripe_customer.id)
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

	  payment = Payment.new(
	  	stripe_charge_id: charge[:id],
	  	customer: @customer,
	  	payment_method: payment_method
	  )

	  if charge
	  	@ticket.update_attributes(has_paid: true)
	  	@ticket.update_attributes(owes_money: false)
	  	redirect_to payment_thanks_path
	  end
	  

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

	def payment_thanks
		@customer = current_customer
		@payment_amount = Stripe::Charge.retrieve(@customer.payments.last.stripe_charge_id)[:amount]
	end
end
