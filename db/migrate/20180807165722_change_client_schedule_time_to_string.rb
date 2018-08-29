class ChangeClientScheduleTimeToString < ActiveRecord::Migration
  def change
    change_column :client_schedules, :time, :string
  end
end
