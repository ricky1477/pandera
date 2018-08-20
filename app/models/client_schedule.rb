class ClientSchedule < ActiveRecord::Base
    belongs_to :schedule
    belongs_to :client
    belongs_to :service
    before_create :set_client_id
    after_save :create_new_services

    def create_new_services
      #Rails.logger.info '---TESTING---'
      #Rails.logger.info self.inspect
      if self.done && self.done_changed?
        #Rails.logger.info '---CHANGED---'
        #Rails.logger.info self.inspect
        s = Service.create(date: self.schedule.date, client_id: self.client_id, notes: self.notes, description: self.service_type)
        #Rails.logger.info '---SERVICE---'
        #Rails.logger.info s.inspect
        #Rails.logger.info self.inspect

        ## TODO Add service price
        self.update_columns(service_id: s.id) # Doesn't call callback
      end
    end

    def set_client_id
      self.client_id = Client.find_by_street_address(self.client_street_address).id
    end


end
