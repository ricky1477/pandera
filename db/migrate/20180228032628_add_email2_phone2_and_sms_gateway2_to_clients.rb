class AddEmail2Phone2AndSmsGateway2ToClients < ActiveRecord::Migration
  def change
    add_column :clients, :email2, :string
    add_column :clients, :phone2, :string
    add_column :clients, :sms_gateway2, :string
  end
end
