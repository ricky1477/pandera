class AddPaidAndInvoiceIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :paid, :boolean
    add_column :services, :invoice_id, :integer
  end
end
