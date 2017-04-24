class InvoiceSmsMailer < ApplicationMailer
	def invoice_created(invoice)
		@invoice = invoice
		mail to: invoice.client.curated_phone+invoice.client.sms_gateway,
			 subject: 'Your monthly invoice has been created!'
	end
	def invoice_reminder(invoice)
		@invoice = invoice
		mail to: invoice.client.curated_phone+invoice.client.sms_gateway,
			 subject: 'Your monthly invoice is overdue!'
	end
end
