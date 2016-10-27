require 'rails_helper'

RSpec.describe Service, type: :model do

	describe 'validations' do
		it { should belong_to(:client) }
		it { should validate_presence_of(:client_id) }
		it { should validate_presence_of(:price) }
	end

	describe 'test search method' do
		it 'finds services appropriately using search' do
			client = FactoryGirl.create(:client)
			service = FactoryGirl.create(:service, client_id: client.id)
			expect(Service.search('2016-10-10')).to include(service)
			expect(Service.search('TestServiceDescription')).to include(service)
			expect(Service.search('99.99')).to include(service)
		end
	end
end