class AddTimeTypeNotesToClientSchedule < ActiveRecord::Migration
  def change
    add_column :client_schedules, :time, :datetime
    add_column :client_schedules, :type, :string
    add_column :client_schedules, :notes, :string
  end
end
