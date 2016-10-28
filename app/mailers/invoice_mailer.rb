class InvoiceMailer < ApplicationMailer
	def invoice_created(invoice)
		@invoice = invoice
		mail to: invoice.client.email,
			 subject: 'Your monthly invoice has been created!'
	end
end
