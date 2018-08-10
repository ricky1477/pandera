class ClientSchedule < ActiveRecord::Base
    belongs_to :schedule
    belongs_to :client
    before_create :set_client_id

    def set_client_id
      self.client_id = Client.find_by_street_address(self.client_street_address).id
    end
end
