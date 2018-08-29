class RenameClientScheduleServiceType < ActiveRecord::Migration
  def change
    rename_column :client_schedules, :type, :service_type
  end
end
