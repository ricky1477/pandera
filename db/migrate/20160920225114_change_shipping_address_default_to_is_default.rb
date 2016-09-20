class ChangeShippingAddressDefaultToIsDefault < ActiveRecord::Migration
    def change
        rename_column :shipping_addresses, :default, :is_default
    end
end
