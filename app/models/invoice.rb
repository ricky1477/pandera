class Invoice < ActiveRecord::Base
      before_create :compute_invoice_num
      belongs_to :client

      def compute_invoice_num
          self.invoice_number = ( (Invoice.last.id + 1).to_s + Time.now.year.to_s ).to_i
      end

end
