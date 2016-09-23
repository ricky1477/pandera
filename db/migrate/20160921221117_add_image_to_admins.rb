class AddImageToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :image, :string
  end
end
