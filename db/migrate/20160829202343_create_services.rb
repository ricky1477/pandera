class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.date :date
      t.text :description
      t.decimal :price
      t.date :maturity

      t.timestamps null: false
    end
  end
end
