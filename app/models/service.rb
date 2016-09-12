class Service < ActiveRecord::Base
      belongs_to :client
      belongs_to :invoice
      validates :price, presence: true
end
