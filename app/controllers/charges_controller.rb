class ChargesController < ApplicationController

    def new
    end

    def create
      invoice_id = params[:invoice_id].keys.first
      @invoice = Invoice.find(invoice_id)

      # Amount in cents
      @amount = (@invoice.total * 100).to_i

      customer = Stripe::Customer.create(
        :email => @invoice.client.email,
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @invoice.description,
        :currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end


end
