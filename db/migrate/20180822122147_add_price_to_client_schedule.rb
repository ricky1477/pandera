class AddPriceToClientSchedule < ActiveRecord::Migration
  def change
    add_column :client_schedules, :price, :decimal
  end
end
