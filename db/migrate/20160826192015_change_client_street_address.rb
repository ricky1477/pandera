class ChangeClientStreetAddress < ActiveRecord::Migration
  def change
    remove_column :clients, :street_ddress
    add_column :clients, :street_address, :string
  end
end
