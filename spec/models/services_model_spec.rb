require 'rails_helper'

RSpec.describe Service, type: :model do

	describe 'validations' do
		client = FactoryGirl.create(:client)

		it 'requires client_id' do
			service = Service.new(client_id: '')
			expect(service.valid?).to be_falsy
		end
		it 'requires price' do
			service = Service.new(price: '')
			service.valid?
			expect(service.errors[:price]).not_to be_empty
		end
		describe 'associations' do
			it 'has belongs_to client association' do
				service = FactoryGirl.create(:service, client_id: client.id)
				expect(service.client).to eq(client)
			end
		end
		it { should belong_to(:client) }
	end
end