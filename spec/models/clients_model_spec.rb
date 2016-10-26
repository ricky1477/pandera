require 'rails_helper'

RSpec.describe Client, type: :model do

	describe 'validations' do
		it 'requires name' do
			client = Client.new(name: '')
			#client.valid?
			#expect(client.errors[:name]).to include("não pode estar em branco")
			#expect(client.errors[:name]).not_to be_empty
			expect(client.valid?).to be_falsy
		end
		it 'requires street_address' do
			client = Client.new(street_address: '')
			client.valid?
			expect(client.errors[:street_address]).not_to be_empty
		end
	end
end