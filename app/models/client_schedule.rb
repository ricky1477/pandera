class ClientSchedule < ActiveRecord::Base
    belongs_to :schedule
    belongs_to :client
end
