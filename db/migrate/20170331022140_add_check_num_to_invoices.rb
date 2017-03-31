class AddCheckNumToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :check_number, :string
  end
end
