class ClientSchedule < ActiveRecord::Base
    belongs_to :schedule
    belongs_to :client
    belongs_to :service, dependent: :destroy
    before_create :set_client_id
    after_save :create_new_services
    validates_presence_of :price, :if => :done?, :message => "should be present to be marked as done."

    def create_new_services
      if self.done && self.done_changed? && self.service_id.nil?
        s = Service.create(date: self.schedule.date, client_id: self.client_id, notes: self.notes, description: self.service_type, price: self.price.to_s)
        self.update_columns(service_id: s.id) # Doesn't call callback
      end
    end

    def set_client_id
      client_name = self.client_street_address[0..self.client_street_address.index(' | ')-1]
      client_address = self.client_street_address[self.client_street_address.index(' | ')+3..self.client_street_address.length-1]
      self.client_id = Client.find_by_name(client_name).id
      #self.client_street_address = client_address
    end

end
