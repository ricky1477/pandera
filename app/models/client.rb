class Client < ActiveRecord::Base
    has_many :services, foreign_key: "client_id"
    has_many :invoices, foreign_key: "client_id"
    has_many :estimates, foreign_key: "client_id"
    validates :name, presence: true#, uniqueness: true
    validates :street_address, presence: true
    #validates :email, presence: true
    #validates :phone, presence: true

    CARRIERS = [['AT&T' ,'@txt.att.net'],
                ['Boost Mobile' ,'@sms.myboostmobile.com'],
                ['Sprint' ,'@messaging.sprintpcs.com'],
                ['T-Mobile' ,'@tmomail.net'],
                ['U.S. Celular' ,'@email.uscc.net'],
                ['Verizon' ,'@vtext.com'],
                ['Virgin Mobile' ,'@vmobl.com'],
                ['Altel' ,'@sms.altelwireless.com']]

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

    def curated_phone
        self.phone.gsub!(Regexp.union('(', ')', '-',' '), '')
    end
end