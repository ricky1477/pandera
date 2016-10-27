require 'rails_helper'

RSpec.describe Client, type: :model do

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:street_address) }
	end
end