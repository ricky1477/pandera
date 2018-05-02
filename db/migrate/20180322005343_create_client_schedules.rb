class CreateClientSchedules < ActiveRecord::Migration
  def change
    create_table :client_schedules do |t|
      t.integer :client_id
      t.integer :schedule_id

      t.timestamps null: false
    end
  end
end
