class Schedule < ActiveRecord::Base
    validates :date, presence: true
    has_many :client_schedules, dependent: :destroy
    accepts_nested_attributes_for :client_schedules, :reject_if => lambda { |a| a[:client_street_address].blank? }, :allow_destroy => true
end
