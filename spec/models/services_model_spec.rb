require 'rails_helper'

RSpec.describe Service, type: :model do

	describe 'validations' do
		it { should belong_to(:client) }
		it { should validate_presence_of(:client_id) }
		it { should validate_presence_of(:price) }
	end
end