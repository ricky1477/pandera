class AddNotesToClients < ActiveRecord::Migration
  def change
    add_column :clients, :notes, :text
  end
end
