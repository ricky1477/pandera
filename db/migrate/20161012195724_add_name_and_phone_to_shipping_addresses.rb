class AddNameAndPhoneToShippingAddresses < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :email, :string
    add_column :shipping_addresses, :phone, :string
  end
end
