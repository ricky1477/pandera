class ChangeUserFields < ActiveRecord::Migration
  def change
    remove_column :clients, :dob
    remove_column :clients, :address
    add_column :clients, :dob, :date
    add_column :clients, :street_ddress, :string
    add_column :clients, :city, :string
    add_column :clients, :zipcode, :string
  end
end
