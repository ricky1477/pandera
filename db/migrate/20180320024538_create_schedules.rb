class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
