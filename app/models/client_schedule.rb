class ClientSchedule < ActiveRecord::Base
    belongs_to :schedule
    belongs_to :client
    has_one :service
    before_create :set_client_id
    after_save :create_new_services

    def create_new_services
      Rails.logger.info '---TESTING---'
      Rails.logger.info self.inspect
      if self.done && self.done_changed?
        Rails.logger.info '---CHANGED---'
        # Add service_id as field with has_one relationship
        #Service.create(id: integer, date: date, description: text, price: decimal, maturity: date, created_at: datetime, updated_at: datetime, client_id: integer, paid: boolean, invoice_id: integer, notes: text)
      end
    end

    def set_client_id
      self.client_id = Client.find_by_street_address(self.client_street_address).id
    end


end
