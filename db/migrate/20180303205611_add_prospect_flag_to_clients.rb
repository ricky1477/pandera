class AddProspectFlagToClients < ActiveRecord::Migration
  def change
    add_column :clients, :prospect, :boolean
  end
end
