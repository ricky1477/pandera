class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :description
      t.decimal :price
      t.integer :client_id
      t.text :notes

      t.timestamps null: false
    end
  end
end
