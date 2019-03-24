class AddPayableTo < ActiveRecord::Migration
  def change
      add_column :invoices, :payable_to, :string
  end
end
