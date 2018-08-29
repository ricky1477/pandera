class AddDoneToClientSchedule < ActiveRecord::Migration
  def change
    add_column :client_schedules, :done, :boolean
  end
end
