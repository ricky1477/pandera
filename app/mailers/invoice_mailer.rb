class InvoiceMailer < ApplicationMailer
  def invoice_created(invoice)
		@invoice = invoice
		mail to: invoice.client.email,
			 subject: 'Your monthly invoice has been created!'
	end
  def invoice_reminder(invoice)
		@invoice = invoice
		mail to: invoice.client.email,
			 subject: 'Your monthly invoice is overdue!'
	end

end
