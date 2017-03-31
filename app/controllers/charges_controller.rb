class ChargesController < ApplicationController

    def new
    end

    def create
      invoice_id = params[:invoice_id].keys.first
      @invoice = Invoice.find(invoice_id)

      # Amount in cents
      @amount = (params[:amount] * 100).to_i

      customer = Stripe::Customer.create(
        :email => @invoice.client.email,
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
				:customer    => customer.id,
				:description => @invoice.description,
				:amount      => @amount,
				:currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
