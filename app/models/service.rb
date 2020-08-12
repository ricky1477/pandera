class Service < ActiveRecord::Base
      belongs_to :client
      belongs_to :invoice, dependent: :destroy
      validates :price, presence: true
      validates :client_id, presence: true
      #before_destroy :check_invoice_association
      before_save :price

      DESCRIPTION = ['Weekly Cutting', 'Bi-weekly Cutting', 'Mulching', 'Gutter Cleaning', 'Trimming Bushes and Shrubs','Fall Clean-Up',
      'Fertilizer', 'Aeration and Seeding', 'Power Washing', 'Snow Removal', 'Other']
      TIME = ['5:00am','5:30am','6:00am','6:30am','7:00am','7:30am','8:00am','8:30am',
              '9:00am','9:30am','10:00am','10:30am','11:00am','11:30am',
              '12:00am','12:30am','1:00pm','1:30pm','2:00pm','2:30pm',
              '3:00pm','3:30pm','4:00pm','4:30pm','5:00pm','5:30pm',
              '6:00pm','6:30pm','7:00pm','7:30pm','8:00pm','8:30pm']

    def self.search(search)
        if search
			joins('JOIN clients ON clients.id = services.client_id').
            where(' clients.name ILIKE ? OR CAST( date AS text ) ILIKE ?
				OR CAST( price AS text ) ILIKE ? OR description ILIKE ?
				OR CAST(maturity AS text) ILIKE ?',
             "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
        else
            where(nil)
        end
    end

    def check_invoice_association
        return false if self.invoice
    end

    # Remove commas and dollar signs before saving to DB
    def price=(value)
        return unless value && value.strip.length > 0
        value = value.to_s.tr('$ ,', '').to_f
        write_attribute(:price, value)
    end

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |service|
          csv << service.attributes.values_at(*column_names)
        end
      end
    end
end
