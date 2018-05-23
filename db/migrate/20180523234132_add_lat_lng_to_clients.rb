class AddLatLngToClients < ActiveRecord::Migration
  def change
    add_column :clients, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :clients, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
