class AddSmsGatewayToClient < ActiveRecord::Migration
  def change
    add_column :clients, :sms_gateway, :string
  end
end
