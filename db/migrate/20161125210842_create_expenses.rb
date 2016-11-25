class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :price
      t.string :description
      t.string :category

      t.timestamps null: false
    end
  end
end
