class RemoveDateOfServiceAndPriceToInvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :date_of_service
    remove_column :invoices, :price
  end
end
