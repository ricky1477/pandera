class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :clients, :owed
  end
end
