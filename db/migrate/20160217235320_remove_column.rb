class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :articles, :avatar_file_name
  	remove_column :articles, :avatar_content_type
  	remove_column :articles, :avatar_file_size
  	remove_column :articles, :avatar_updated_at
  end
end
