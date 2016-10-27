class AddForeignKeyFromServicesToClients < ActiveRecord::Migration
    def change
        add_foreign_key :services, :clients
    end
end
