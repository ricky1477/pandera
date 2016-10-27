require 'rails_helper'

RSpec.describe Client, type: :model do

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:street_address) }
	end

	describe 'test search method' do
		it 'finds clients appropriately using search' do
			client = FactoryGirl.create(:client)
			expect(Client.search('TestClientName')).to include(client)
			expect(Client.search('StreetAddress')).to include(client)
			expect(Client.search('Gaithersburg')).to include(client)
			expect(Client.search('20853')).to include(client)
			expect(Client.search('(301) 519-210X')).to include(client)
		end
	end
end