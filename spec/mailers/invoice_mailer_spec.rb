require "rails_helper"

RSpec.describe InvoiceMailer, type: :mailer do
	include Rails.application.routes.url_helpers

	let(:client)  {FactoryGirl.create(:client)}
	let(:invoice) { FactoryGirl.create(:invoice, client_id: client.id) }
	let(:shipping_address) { FactoryGirl.create(:shipping_address) }
	let(:email) { InvoiceMailer.invoice_created(invoice).deliver_now }

	it 'sends invoice email to client at time of creation' do
        shipping_address
		expect(email.to).to include(invoice.client.email)
	end

	it 'has correct subject' do
        shipping_address
		expect(email.subject).to include('Your monthly invoice has been created!')
	end

	it 'has invoice link in body message' do
        shipping_address
		expect(email.body.to_s).to include(invoice_url(invoice.id))
	end
end
