class AddAuthorIdToOntaps < ActiveRecord::Migration
  def change
    add_column :ontaps, :author_id, :integer
    add_index :ontaps, :author_id
  end
end
