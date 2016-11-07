class Client < ActiveRecord::Base
    has_many :services, foreign_key: "client_id"
    has_many :invoices, foreign_key: "client_id"
    validates :name, presence: true
    validates :street_address, presence: true
    validates :email, presence: true

    def self.search(search)
        if search
            where('name ILIKE ? OR email ILIKE ? OR phone ILIKE ? OR CAST( dob AS text ) ILIKE ?
				OR city ILIKE ? OR zipcode ILIKE ? OR street_address ILIKE ?',
             "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
             "%#{search}%", "%#{search}%")
        else
            where(nil)
        end
    end
end