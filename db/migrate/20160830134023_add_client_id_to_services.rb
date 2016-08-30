class AddClientIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :client_id, :integer
  end
end
