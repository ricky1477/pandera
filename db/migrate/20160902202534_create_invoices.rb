class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.integer :invoice_number
      t.date :maturity
      t.date :date_of_service
      t.text :description
      t.decimal :price
      t.decimal :total

      t.timestamps null: false
    end
  end
end
