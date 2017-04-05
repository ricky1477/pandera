class AddCreditAndOwedToClient < ActiveRecord::Migration
  def change
    add_column :clients, :credit, :decimal
    add_column :clients, :owed, :decimal
  end
end
