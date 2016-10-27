require 'rails_helper'

RSpec.describe Invoice, type: :model do

	describe 'validations' do
		it { should belong_to(:client) }
		it { should validate_presence_of(:client_id) }
	end

	describe 'test search method' do
		it 'finds invoices appropriately using search' do
			client = FactoryGirl.create(:client)
			invoice = FactoryGirl.create(:invoice, client_id: client.id)
			expect(Invoice.search('TestInvoiceDescription')).to include(invoice)
		end
	end

	describe 'test compute_total method' do
		it 'computes total for one service' do
			client = FactoryGirl.create(:client)
			service = FactoryGirl.create(:service, client_id: client.id)
			invoice = FactoryGirl.create(:invoice, client_id: client.id)
			expect(Invoice.search('99.99')).to include(invoice)
		end

		it 'computes total for two services' do
			client = FactoryGirl.create(:client)
			service = FactoryGirl.create(:service, client_id: client.id)
			service2 = FactoryGirl.create(:service, client_id: client.id, price: '00.01')
			invoice = FactoryGirl.create(:invoice, client_id: client.id)
			expect(Invoice.search('100.0')).to include(invoice)
		end

	end
end