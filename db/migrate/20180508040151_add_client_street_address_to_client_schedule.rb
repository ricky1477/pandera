class AddClientStreetAddressToClientSchedule < ActiveRecord::Migration
  def change
    add_column :client_schedules, :client_street_address, :string
  end
end
