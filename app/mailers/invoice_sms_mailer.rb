class InvoiceSmsMailer < ApplicationMailer
	def invoice_created(invoice)
		@invoice = invoice
		mail to: invoice.client.phone+invoice.client.sms_gateway,
			 subject: 'Your monthly invoice has been created!'
	end
end
