class AddAdminIdToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :admin_id, :integer
    add_index :authors, :admin_id, unique: true
  end
end
