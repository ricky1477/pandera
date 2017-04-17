class ChargesController < ApplicationController

    def new
    end

    def create
      invoice_id = params[:invoice_id].keys.first
      @invoice = Invoice.find(invoice_id)

      # Amount in cents
      @amount = (params[:amount].to_f * 100).to_i

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

      @client = @invoice.client
      if @amount < @invoice.total
        @client.credit = @client.credit - (@invoice.total - (@amount.to_f/100))
        @client.save!
      elsif @amount > @invoice.total
        if @client.credit
        @client.credit = @client.credit + ((@amount.to_f/100) - @invoice.total)
        else
           @client.credit = ((@amount.to_f/100) - @invoice.total)
        end
        @client.save!
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
