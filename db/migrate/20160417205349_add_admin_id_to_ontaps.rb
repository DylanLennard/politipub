class AddAdminIdToOntaps < ActiveRecord::Migration
  def change
    add_column :ontaps, :admin_id, :integer
    add_index :ontaps, :admin_id
  end
end
