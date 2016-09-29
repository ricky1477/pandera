class ShippingAddress < ActiveRecord::Base
    #before_update :clear_defaults

    def clear_defaults
      if self.is_default_changed?
        ShippingAddress.where.not(id: self.id).each do |sa|
            sa.is_default = false
            sa.save!
        end
      end
    end
end
