class Schedule < ActiveRecord::Base
    has_many :client_schedules, dependent: :destroy
    accepts_nested_attributes_for :client_schedules, :reject_if => lambda { |a| a[:client_id].blank? }, :allow_destroy => true
end
