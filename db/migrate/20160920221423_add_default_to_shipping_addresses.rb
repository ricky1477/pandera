class AddDefaultToShippingAddresses < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :default, :boolean
  end
end
