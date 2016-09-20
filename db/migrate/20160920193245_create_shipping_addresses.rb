class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
