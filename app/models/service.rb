class Service < ActiveRecord::Base
      belongs_to :client
      belongs_to :invoice
      validates :price, presence: true
      validates :client_id, presence: true
      before_destroy :check_invoice_association
      before_save :price

      DESCRIPTION = ['Weekly Cutting', 'Bi-weekly Cutting', 'Mulching', 'Gutter Cleaning', 'Trimming Bushes and Shrubs','Fall Clean-Up',
      'Fertilizer', 'Aeration and Seeding', 'Power Washing', 'Snow Removal', 'Other']

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

end
