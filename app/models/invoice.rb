class Invoice < ActiveRecord::Base
      before_save :compute_invoice_num
      before_save :link_services_to_invoice
      belongs_to :client
      has_many :services

      def compute_invoice_num
          self.invoice_number = (Invoice.all.length <= 1) ? ((1).to_s + Time.now.year.to_s ).to_i : ( (Invoice.last.id + 1).to_s + Time.now.year.to_s ).to_i
      end

      def link_services_to_invoice
        self.services = self.client.services.where("paid IS NOT TRUE")
      end

      def self.search(search)
        if search
			joins('JOIN clients ON clients.id = invoices.client_id').
            where(' clients.name ILIKE ? OR CAST( invoice_number AS text ) ILIKE ?
				OR CAST(maturity AS text) ILIKE ?
				OR CAST( date_of_service AS text ) ILIKE ? OR description ILIKE ?
				OR CAST(price as text) ILIKE ? OR CAST(total as text) ILIKE ?',
             "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
             "%#{search}%", "%#{search}%")
        else
            where(nil)
        end
    end

end
