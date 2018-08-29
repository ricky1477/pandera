class AddServiceIdToClientSchedule < ActiveRecord::Migration
  def change
    add_column :client_schedules, :service_id, :integer
  end
end
